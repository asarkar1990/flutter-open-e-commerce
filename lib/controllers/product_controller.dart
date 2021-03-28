import 'package:opencommerce/models/models.dart';
import 'package:opencommerce/services/product_service.dart';

// View <===> Controller <===> Service

class ProductController {
  ProductService productService = ProductService();
  List<Product> products = <Product>[];

// getProducts() async {
//   products = await productService.getProducts();
// }
}