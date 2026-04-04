import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage secureStorage;

  SecureStorageService(this.secureStorage);

  // Save data
  Future<void> setData({required String key, required String value}) async {
    await secureStorage.write(key: key, value: value);
  }

  // Read data
  Future<String?> getString({required String key}) async {
    return await secureStorage.read(key: key);
  }

  // Delete a specific key
  Future<void> delete({required String key}) async {
    await secureStorage.delete(key: key);
  }

  // Clear all stored data
  Future<void> clear() async {
    await secureStorage.deleteAll();
  }
}
