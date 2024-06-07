import 'package:fake_api_consumer/features/product/domain/entities/product.dart';
import 'package:fake_api_consumer/features/product/domain/repositories/product_repository.dart';

class ProductController {
  const ProductController(this._repository);

  final ProductRepository _repository;

  Future<void> showProducts() async {
    final failureOrProducts = await _repository.getAllProducts();
    failureOrProducts.fold(
      (failure) => print(failure.message),
      (products) => _printProducts(products),
    );
  }

  void _printProducts(List<Product> products) {
    print('\n\n*** Products ***');
    for (int i = 0; i < products.length; i++) {
      final product = products[i];
      print('\nProduct #${i + 1}');
      print('Title: ${product.title}');
      print('Description: ${product.description}');
      print('Price: \$${product.price}');
      print('Rating: ${product.rating}');
      print('Category: ${product.category}');
    }
  }
}
