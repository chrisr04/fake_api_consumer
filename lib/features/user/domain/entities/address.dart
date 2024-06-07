import 'package:fake_api_consumer/features/user/domain/entities/geolocation.dart';

class Address {
  const Address({
    required this.geolocation,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });

  final Geolocation geolocation;
  final String city;
  final String street;
  final int number;
  final String zipcode;
}
