import 'package:fake_api_consumer/features/user/data/remote/model/geolocation_model.dart';
import 'package:fake_api_consumer/features/user/domain/entities/address.dart';

class AddressModel extends Address {
  AddressModel({
    required super.geolocation,
    required super.city,
    required super.street,
    required super.number,
    required super.zipcode,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        geolocation: GeolocationModel.fromJson(json['geolocation'] ?? {}),
        city: json['city'] ?? '',
        street: json['street'] ?? '',
        number: json['number'] ?? 0,
        zipcode: json['zipcode'] ?? '',
      );
}
