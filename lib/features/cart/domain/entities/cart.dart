import 'package:fake_api_consumer/features/cart/domain/entities/cart_product.dart';

class Cart {
  const Cart({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  final int id;
  final int userId;
  final DateTime date;
  final List<CartProduct> products;
}
