import '../../Functions/remove_bearer.dart';
import '../jwt_decoder/jwt_decoder_service.dart';
import '../storage_services/secure_storage/secure_storage_keys.dart';
import '../storage_services/secure_storage/secure_storage_service.dart';

class AuthCredentialsManager {
  final SecureStorageService secureStorageService;
  final JwtDecoderService jwtDecoder;
  AuthCredentialsManager({
    required this.secureStorageService,
    required this.jwtDecoder,
  });

  AuthCredentials? _authCredentialsModel;
  static const String _userIdFieldInDecodedAccessToken = 'userId';
  Future<void> init() async {
    _authCredentialsModel = AuthCredentials._(
      accessToken: await getAccessToken(),
      refreshToken: await getRefreshToken(),
    );
  }

  String? get accessToken => _authCredentialsModel?.accessToken;
  String? get refreshToken => _authCredentialsModel?.refreshToken;
  String? get userId {
    var decodedToken = jwtDecoder.decodeToken(
      token: _authCredentialsModel?.accessToken,
    );
    return decodedToken?[_userIdFieldInDecodedAccessToken];
  }

  Future<String?> getAccessToken() async {
    return await secureStorageService.getString(
      key: SecureStorageKeys.accessToken,
    );
  }

  Future<String?> getRefreshToken() async {
    return await secureStorageService.getString(
      key: SecureStorageKeys.refreshToken,
    );
  }

  Future<void> storeAccessToken(String token) async {
    token = removeBearer(token);
    await secureStorageService.setData(
      key: SecureStorageKeys.accessToken,
      value: token,
    );
    _authCredentialsModel?.accessToken = token;
  }

  Future<void> storeRefreshToken(String token) async {
    token = removeBearer(token);
    await secureStorageService.setData(
      key: SecureStorageKeys.refreshToken,
      value: token,
    );
    _authCredentialsModel?.refreshToken = token;
  }

  Future<void> storeTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    accessToken = removeBearer(accessToken);
    refreshToken = removeBearer(refreshToken);

    await Future.wait([
      storeAccessToken(accessToken),
      storeRefreshToken(refreshToken),
    ]);
    await init();
  }

  Future<void> clearTokens() async {
    await secureStorageService.clear();
    _authCredentialsModel?.accessToken = null;
    _authCredentialsModel?.refreshToken = null;
    _authCredentialsModel = null;
  }

  bool userIsAuthenticated() {
    bool isLoggedIn = _authCredentialsModel?.accessToken != null;
    return isLoggedIn;
  }
}

class AuthCredentials {
  String? accessToken;
  String? refreshToken;

  AuthCredentials._({required this.accessToken, required this.refreshToken});
}
