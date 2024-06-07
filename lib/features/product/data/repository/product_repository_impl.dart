import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fake_api_consumer/core/errors/failure/failure.dart';
import 'package:fake_api_consumer/core/errors/failure/remote/remote_failure.dart';
import 'package:fake_api_consumer/features/product/data/remote/datasource/product_remote_datasource.dart';
import 'package:fake_api_consumer/features/product/domain/entities/product.dart';
import 'package:fake_api_consumer/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  const ProductRepositoryImpl(this._remoteDataSource);

  final ProductRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    try {
      final products = await _remoteDataSource.getAllProducts();
      return Right(products);
    } on SocketException {
      return Left(NoInternetFailure());
    } on FormatException {
      return Left(InvalidResponseFailure());
    } catch (e) {
      return Left(FetchDataFailure(e.toString()));
    }
  }
}
