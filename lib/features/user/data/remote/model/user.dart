import 'package:fake_api_consumer/features/user/data/remote/model/address.dart';
import 'package:fake_api_consumer/features/user/data/remote/model/user_name_model.dart';
import 'package:fake_api_consumer/features/user/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] ?? 0,
        name: UserNameModel.fromJson(json['name'] ?? {}),
        email: json['email'] ?? '',
        phone: json['phone'] ?? '',
        address: AddressModel.fromJson(json['address'] ?? {}),
      );
}
