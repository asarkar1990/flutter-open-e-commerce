import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opencommerce/models/models.dart';

class CartService {
  final fireStore = FirebaseFirestore.instance;

  Stream<List<Product>> getCartStream() {
    return fireStore
        .collection('Cart')
        .snapshots()
        .map((snapShot) => snapShot.docs.map((doc) {
              Product p = Product.fromMap(doc.data());
              p.id = doc.id;
              return p;
            }).toList());
  }
}
