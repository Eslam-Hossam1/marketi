import 'package:nextcart/features/banners/domain/entities/banner_entity.dart';

class BannerModel extends BannerEntity {
  const BannerModel({
    required super.id,
    required super.title,
    required super.imageUrl,
    required super.isActive,
    required super.sortOrder,
    required super.targetType,
    required super.targetOperator,
    required super.targetValue,
    super.startAt,
    super.endAt,
    required super.createdAt,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['image_url'] as String,
      isActive: json['is_active'] as bool,
      sortOrder: (json['sort_order'] as num).toInt(),
      targetType: json['target_type'] as String,
      targetOperator: json['target_operator'] as String,
      targetValue: json['target_value'] as String,
      startAt: json['start_at'] != null
          ? DateTime.parse(json['start_at'] as String)
          : null,
      endAt: json['end_at'] != null
          ? DateTime.parse(json['end_at'] as String)
          : null,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }
}
