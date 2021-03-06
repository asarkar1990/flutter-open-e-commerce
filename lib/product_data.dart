import 'package:opencommerce/model/models.dart';

List<Product> products() {
  List<Product> products = <Product>[];
  for (int i = 1; i <= 20; i++) {
    var _product = Product(
        name: 'Product $i',
        price: 100.0 * i,
        inStock: true,
        description:
            'Product $i is dummy product which cost ${100 * i} . Product is in stock now.',
        imageUrl:
            'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-se-black-select-2020?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1586574260051');
    products.add(_product);
  }
  return products;
}
