import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:fake_api_consumer/core/errors/failure/failure.dart';
import 'package:fake_api_consumer/core/errors/failure/remote/remote_failure.dart';
import 'package:fake_api_consumer/features/user/data/remote/datasource/user_remote_datasource.dart';
import 'package:fake_api_consumer/features/user/domain/entities/user.dart';
import 'package:fake_api_consumer/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl(this._remoteDataSource);

  final UserRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<User>>> getAllUsers() async {
    try {
      final users = await _remoteDataSource.getAllUsers();
      return Right(users);
    } on SocketException {
      return Left(NoInternetFailure());
    } on FormatException {
      return Left(InvalidResponseFailure());
    } catch (e) {
      return Left(FetchDataFailure(e.toString()));
    }
  }
}
