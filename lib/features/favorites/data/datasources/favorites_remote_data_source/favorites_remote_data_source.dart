import 'package:nextcart/features/favorites/data/models/favorites_response_model.dart';

abstract class FavoritesRemoteDataSource {
  Future<FavoritesResponseModel> getFavorites();
  Future<void> addToFavorites(String productId);
  Future<void> removeFromFavorites(String productId);
}
