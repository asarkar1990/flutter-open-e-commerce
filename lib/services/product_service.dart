import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opencommerce/models/models.dart';

class ProductService {
  final fireStore = FirebaseFirestore.instance;

  Stream<List<Product>> getProductStream() {
    return fireStore
        .collection('Products')
        .snapshots()
        .map((snapShot) => snapShot.docs.map((doc) {
              Product p = Product.fromMap(doc.data());
              p.id = doc.id;
              return p;
            }).toList());
  }
}
