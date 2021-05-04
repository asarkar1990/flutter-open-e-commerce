import 'package:get/get.dart';
import 'package:opencommerce/models/models.dart';
import 'package:opencommerce/services/product_service.dart';

// View <===> Controller <===> Service

class ProductController extends GetxController {
  var count = 1;
  ProductService productService = ProductService();
  List<Product> products = <Product>[];

  ProductController() {
    getProducts();
  }

  increment() {
    count++;
    update();
  }

  getProducts() async {
    products.addAll(await productService.getProducts());
    update();
  }
}
