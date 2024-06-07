import 'package:fake_api_consumer/features/cart/domain/entities/cart_product.dart';

class CartProductModel extends CartProduct {
  CartProductModel({
    required super.productId,
    required super.quantity,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      CartProductModel(
        productId: json['productId'] ?? 0,
        quantity: json['quantity'] ?? 0,
      );
}
