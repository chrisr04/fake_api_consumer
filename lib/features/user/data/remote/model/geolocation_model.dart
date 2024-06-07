import 'package:fake_api_consumer/features/user/domain/entities/geolocation.dart';

class GeolocationModel extends Geolocation {
  GeolocationModel({
    required super.lat,
    required super.long,
  });

  factory GeolocationModel.fromJson(Map<String, dynamic> json) =>
      GeolocationModel(
        lat: json['lat'] ?? '',
        long: json['long'] ?? '',
      );
}
