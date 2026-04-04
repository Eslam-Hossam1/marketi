import 'package:marketi/features/home/data/datasources/home_remote_data_source/home_remote_data_source.dart';
import 'package:marketi/features/home/data/models/brand_model.dart';
import 'package:marketi/features/home/data/models/category_model.dart';
import 'package:marketi/features/home/data/models/products_response_model.dart';
import 'package:marketi/features/home/domain/params/product_params.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<List<BrandModel>> getBrands() async {
    await Future.delayed(const Duration(seconds: 1));
    final Map<String, dynamic> fakeResponse = {
      "list": [
        {"name": "Essence", "emoji": "💄"},
        {"name": "Glamour Beauty", "emoji": "✨"},
        {"name": "Velvet Touch", "emoji": "🪞"},
        {"name": "Chic Cosmetics", "emoji": "👛"},
        {"name": "Nail Couture", "emoji": "💅"},
        {"name": "Calvin Klein", "emoji": "👔"},
        {"name": "Chanel", "emoji": "👗"},
        {"name": "Dior", "emoji": "👜"},
        {"name": "Dolce & Gabbana", "emoji": "👠"},
        {"name": "Gucci", "emoji": "🕶️"},
        {"name": "Annibale Colombo", "emoji": "🛋️"},
        {"name": "Furniture Co.", "emoji": "🪑"},
        {"name": "Knoll", "emoji": "🏢"},
        {"name": "Bath Trends", "emoji": "🛁"},
      ],
    };
    return (fakeResponse['list'] as List)
        .map((e) => BrandModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    await Future.delayed(const Duration(seconds: 1));
    final Map<String, dynamic> fakeResponse = {
      "list": [
        {
          "slug": "beauty",
          "name": "Beauty",
          "url": "https://dummyjson.com/products/category/beauty",
          "image":
              "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp",
        },
        {
          "slug": "fragrances",
          "name": "Fragrances",
          "url": "https://dummyjson.com/products/category/fragrances",
          "image":
              "https://cdn.dummyjson.com/product-images/fragrances/calvin-klein-ck-one/1.webp",
        },
        {
          "slug": "furniture",
          "name": "Furniture",
          "url": "https://dummyjson.com/products/category/furniture",
          "image":
              "https://cdn.dummyjson.com/product-images/furniture/modern-wood-chair/1.webp",
        },
        {
          "slug": "groceries",
          "name": "Groceries",
          "url": "https://dummyjson.com/products/category/groceries",
          "image":
              "https://cdn.dummyjson.com/product-images/groceries/organic-apple/1.webp",
        },
        {
          "slug": "home-decoration",
          "name": "Home Decoration",
          "url": "https://dummyjson.com/products/category/home-decoration",
          "image":
              "https://cdn.dummyjson.com/product-images/home-decoration/decorative-lamp/1.webp",
        },
        {
          "slug": "kitchen-accessories",
          "name": "Kitchen Accessories",
          "url": "https://dummyjson.com/products/category/kitchen-accessories",
          "image":
              "https://cdn.dummyjson.com/product-images/kitchen-accessories/silicone-spatula/1.webp",
        },
        {
          "slug": "laptops",
          "name": "Laptops",
          "url": "https://dummyjson.com/products/category/laptops",
          "image":
              "https://cdn.dummyjson.com/product-images/laptops/dell-inspiron-15/1.webp",
        },
        {
          "slug": "mens-shirts",
          "name": "Mens Shirts",
          "url": "https://dummyjson.com/products/category/mens-shirts",
          "image":
              "https://cdn.dummyjson.com/product-images/mens-shirts/blue-&-black-check-shirt/1.webp",
        },
        {
          "slug": "mens-shoes",
          "name": "Mens Shoes",
          "url": "https://dummyjson.com/products/category/mens-shoes",
          "image":
              "https://cdn.dummyjson.com/product-images/mens-shoes/black-leather-sneakers/1.webp",
        },
        {
          "slug": "mens-watches",
          "name": "Mens Watches",
          "url": "https://dummyjson.com/products/category/mens-watches",
          "image":
              "https://cdn.dummyjson.com/product-images/mens-watches/chronograph-watch/1.webp",
        },
        {
          "slug": "mobile-accessories",
          "name": "Mobile Accessories",
          "url": "https://dummyjson.com/products/category/mobile-accessories",
          "image":
              "https://cdn.dummyjson.com/product-images/mobile-accessories/iphone-case/1.webp",
        },
        {
          "slug": "motorcycle",
          "name": "Motorcycle",
          "url": "https://dummyjson.com/products/category/motorcycle",
          "image":
              "https://cdn.dummyjson.com/product-images/motorcycle/sport-bike/1.webp",
        },
        {
          "slug": "skin-care",
          "name": "Skin Care",
          "url": "https://dummyjson.com/products/category/skin-care",
          "image":
              "https://cdn.dummyjson.com/product-images/skin-care/face-cream/1.webp",
        },
        {
          "slug": "smartphones",
          "name": "Smartphones",
          "url": "https://dummyjson.com/products/category/smartphones",
          "image":
              "https://cdn.dummyjson.com/product-images/smartphones/iphone-14-pro/1.webp",
        },
        {
          "slug": "sports-accessories",
          "name": "Sports Accessories",
          "url": "https://dummyjson.com/products/category/sports-accessories",
          "image":
              "https://cdn.dummyjson.com/product-images/sports-accessories/gym-bag/1.webp",
        },
        {
          "slug": "sunglasses",
          "name": "Sunglasses",
          "url": "https://dummyjson.com/products/category/sunglasses",
          "image":
              "https://cdn.dummyjson.com/product-images/sunglasses/aviator-sunglasses/1.webp",
        },
        {
          "slug": "tablets",
          "name": "Tablets",
          "url": "https://dummyjson.com/products/category/tablets",
          "image":
              "https://cdn.dummyjson.com/product-images/tablets/ipad-pro/1.webp",
        },
        {
          "slug": "tops",
          "name": "Tops",
          "url": "https://dummyjson.com/products/category/tops",
          "image":
              "https://cdn.dummyjson.com/product-images/tops/casual-t-shirt/1.webp",
        },
        {
          "slug": "vehicle",
          "name": "Vehicle",
          "url": "https://dummyjson.com/products/category/vehicle",
          "image":
              "https://cdn.dummyjson.com/product-images/vehicle/scooter/1.webp",
        },
        {
          "slug": "womens-bags",
          "name": "Womens Bags",
          "url": "https://dummyjson.com/products/category/womens-bags",
          "image":
              "https://cdn.dummyjson.com/product-images/womens-bags/leather-tote/1.webp",
        },
        {
          "slug": "womens-dresses",
          "name": "Womens Dresses",
          "url": "https://dummyjson.com/products/category/womens-dresses",
          "image":
              "https://cdn.dummyjson.com/product-images/womens-dresses/red-evening-gown/1.webp",
        },
        {
          "slug": "womens-jewellery",
          "name": "Womens Jewellery",
          "url": "https://dummyjson.com/products/category/womens-jewellery",
          "image":
              "https://cdn.dummyjson.com/product-images/womens-jewellery/gold-necklace/1.webp",
        },
        {
          "slug": "womens-shoes",
          "name": "Womens Shoes",
          "url": "https://dummyjson.com/products/category/womens-shoes",
          "image":
              "https://cdn.dummyjson.com/product-images/womens-shoes/high-heel-pumps/1.webp",
        },
        {
          "slug": "womens-watches",
          "name": "Womens Watches",
          "url": "https://dummyjson.com/products/category/womens-watches",
          "image":
              "https://cdn.dummyjson.com/product-images/womens-watches/elegant-watch/1.webp",
        },
      ],
    };
    return (fakeResponse['list'] as List)
        .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<ProductsResponseModel> getProducts(ProductParams params) async {
    await Future.delayed(const Duration(seconds: 1));
    final Map<String, dynamic> fakeResponse = {
      "list": [
        {
          "id": 1,
          "title": "Smartphone XYZ",
          "description": "Latest smartphone with amazing features",
          "category": "electronics",
          "price": 499.99,
          "discountPercentage": 10.0,
          "rating": 4.5,
          "stock": 50,
          "tags": ["smartphone", "mobile", "electronics"],
          "brand": "XYZ Brand",
          "sku": "XYZ123",
          "images": [
            "https://images.unsplash.com/photo-1767418255600-d984f5e48292?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3",
          ],
          "thumbnail":
              "https://images.unsplash.com/photo-1767418255600-d984f5e48292?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3",
        },
        {
          "id": 1,
          "title": "Smartphone XYZ",
          "description": "Latest smartphone with amazing features",
          "category": "electronics",
          "price": 499.99,
          "discountPercentage": 10.0,
          "rating": 4.5,
          "stock": 50,
          "tags": ["smartphone", "mobile", "electronics"],
          "brand": "XYZ Brand",
          "sku": "XYZ123",
          "images": [
            "https://images.unsplash.com/photo-1767418255600-d984f5e48292?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3",
          ],
          "thumbnail":
              "https://images.unsplash.com/photo-1767418255600-d984f5e48292?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3",
        },
        {
          "id": 1,
          "title": "Smartphone XYZ",
          "description": "Latest smartphone with amazing features",
          "category": "electronics",
          "price": 499.99,
          "discountPercentage": 10.0,
          "rating": 4.5,
          "stock": 50,
          "tags": ["smartphone", "mobile", "electronics"],
          "brand": "XYZ Brand",
          "sku": "XYZ123",
          "images": [
            "https://images.unsplash.com/photo-1767418255600-d984f5e48292?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3",
          ],
          "thumbnail":
              "https://images.unsplash.com/photo-1767418255600-d984f5e48292?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3",
        },
        {
          "id": 2,
          "title": "Premium Headphone",
          "description": "Noise cancelling premium headphone",
          "category": "electronics",
          "price": 299.99,
          "discountPercentage": 5.0,
          "rating": 4.8,
          "stock": 30,
          "tags": ["headphone", "audio", "electronics"],
          "brand": "Audio Pro",
          "sku": "AP999",
          "images": [
            "https://images.unsplash.com/photo-1767418255600-d984f5e48292?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3",
          ],
          "thumbnail":
              "https://images.unsplash.com/photo-1767418255600-d984f5e48292?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3",
        },
      ],
      "total": 2,
      "skip": 0,
      "limit": 10,
    };
    return ProductsResponseModel.fromJson(fakeResponse);
  }
}
