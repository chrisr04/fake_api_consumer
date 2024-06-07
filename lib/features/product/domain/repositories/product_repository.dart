import 'package:dartz/dartz.dart';
import 'package:fake_api_consumer/core/errors/failure/failure.dart';
import 'package:fake_api_consumer/features/product/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();
}
