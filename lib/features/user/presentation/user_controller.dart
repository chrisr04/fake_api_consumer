import 'package:fake_api_consumer/features/user/domain/entities/user.dart';
import 'package:fake_api_consumer/features/user/domain/repositories/user_repository.dart';

class UserController {
  const UserController(this._repository);

  final UserRepository _repository;

  Future<void> showUsers() async {
    final failureOrUsers = await _repository.getAllUsers();
    failureOrUsers.fold(
      (failure) => print(failure.message),
      (users) => _printUsers(users),
    );
  }

  void _printUsers(List<User> users) {
    print('\n\n*** Users ***');
    for (int i = 0; i < users.length; i++) {
      final user = users[i];
      print('\nUser #${i + 1}');
      print('Name: ${user.name.firstname} ${user.name.lastname}');
      print('Email: ${user.email}');
      print('Phone: ${user.phone}');
      print(
          'Address: ${user.address.street}, ${user.address.city}, ${user.address.zipcode}');
    }
  }
}
