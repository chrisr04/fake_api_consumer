import 'package:fake_api_consumer/features/user/domain/entities/address.dart';
import 'package:fake_api_consumer/features/user/domain/entities/user_name.dart';

class User {
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });

  final int id;
  final UserName name;
  final String email;
  final String phone;
  final Address address;
}
