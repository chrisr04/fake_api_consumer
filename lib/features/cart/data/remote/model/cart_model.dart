import 'package:fake_api_consumer/features/cart/data/remote/model/cart_product_model.dart';
import 'package:fake_api_consumer/features/cart/domain/entities/cart.dart';

class CartModel extends Cart {
  CartModel({
    required super.id,
    required super.userId,
    required super.date,
    required super.products,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['id'] ?? 0,
        userId: json['userId'] ?? 0,
        date: DateTime.tryParse(json['date'] ?? '') ?? DateTime.now(),
        products: List.from(json['products'] ?? [])
            .map((e) => CartProductModel.fromJson(e))
            .toList(),
      );
}
