class BannerEntity {
  final String id;
  final String title;
  final String imageUrl;
  final bool isActive;
  final int sortOrder;
  final String targetType;
  final String targetOperator;
  final String targetValue;
  final DateTime? startAt;
  final DateTime? endAt;
  final DateTime createdAt;

  const BannerEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.isActive,
    required this.sortOrder,
    required this.targetType,
    required this.targetOperator,
    required this.targetValue,
    this.startAt,
    this.endAt,
    required this.createdAt,
  });
}
