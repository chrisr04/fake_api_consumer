import 'package:dartz/dartz.dart';
import 'package:fake_api_consumer/core/errors/failure/failure.dart';
import 'package:fake_api_consumer/features/cart/domain/entities/cart.dart';

abstract class CartRepository {
  Future<Either<Failure, List<Cart>>> getAllCarts();
}
