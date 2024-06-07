import 'package:fake_api_consumer/features/user/domain/entities/user_name.dart';

class UserNameModel extends UserName {
  UserNameModel({
    required super.firstname,
    required super.lastname,
  });

  factory UserNameModel.fromJson(Map<String, dynamic> json) => UserNameModel(
        firstname: json['firstname'] ?? '',
        lastname: json['lastname'] ?? '',
      );
}
