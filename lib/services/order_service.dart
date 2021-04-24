import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opencommerce/models/models.dart';

class OrderService {
  final _db = FirebaseFirestore.instance.collection('orders');

  Future<void> saveOrder(Order order) {
    DocumentReference doc;
    if (order.uid != null) {
      /// update existing doc
      doc = _db.doc(order.uid);
    } else {
      ///
      /// create new doc
      doc = _db.doc();
      order.uid = doc.id;
    }
    return doc.set(order.toMap(), SetOptions(merge: true));
  }
}
