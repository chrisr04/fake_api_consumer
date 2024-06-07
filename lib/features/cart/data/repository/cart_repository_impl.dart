import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fake_api_consumer/core/errors/failure/failure.dart';
import 'package:fake_api_consumer/core/errors/failure/remote/remote_failure.dart';
import 'package:fake_api_consumer/features/cart/data/remote/datasource/cart_remote_datasource.dart';
import 'package:fake_api_consumer/features/cart/domain/entities/cart.dart';
import 'package:fake_api_consumer/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  const CartRepositoryImpl(this._remoteDataSource);

  final CartRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<Cart>>> getAllCarts() async {
    try {
      final carts = await _remoteDataSource.getAllCarts();
      return Right(carts);
    } on SocketException {
      return Left(NoInternetFailure());
    } on FormatException {
      return Left(InvalidResponseFailure());
    } catch (e) {
      return Left(FetchDataFailure(e.toString()));
    }
  }
}
