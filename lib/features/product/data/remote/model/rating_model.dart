import 'package:fake_api_consumer/features/product/domain/entities/rating.dart';

class RatingModel extends Rating {
  RatingModel({
    required super.rate,
    required super.count,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        rate: json['rate']?.toDouble() ?? 0.0,
        count: json['count'] ?? 0,
      );
}
