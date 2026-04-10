import '../entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.slug,
    required super.name,
    required super.url,
    required super.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      slug: json['slug'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'slug': slug,
      'name': name,
      'url': url,
      'image': image,
    };
  }
}
