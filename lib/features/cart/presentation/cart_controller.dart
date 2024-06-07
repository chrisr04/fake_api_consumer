import 'package:fake_api_consumer/features/cart/domain/entities/cart.dart';
import 'package:fake_api_consumer/features/cart/domain/repositories/cart_repository.dart';

class CartController {
  const CartController(this._repository);

  final CartRepository _repository;

  Future<void> showCarts() async {
    final failureOrCarts = await _repository.getAllCarts();
    failureOrCarts.fold(
      (failure) => print(failure.message),
      (carts) => _printCarts(carts),
    );
  }

  void _printCarts(List<Cart> carts) {
    print('\n\n*** Carts ***');
    for (int i = 0; i < carts.length; i++) {
      final cart = carts[i];
      print('\nCart #${i + 1}');
      print('UserId: ${cart.userId}');
      print('Date: ${cart.date.toIso8601String()}');
      print('ProductCount: ${cart.products.length}');
    }
  }
}
