import 'package:marketi/features/home/domain/entities/brand_entity.dart';

class BrandModel extends BrandEntity {
  const BrandModel({required super.name, required super.emoji});

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      name: json['name'] as String,
      emoji: json['emoji'] as String,
    );
  }
}
