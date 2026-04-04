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
    );
  }

  String? get accessToken => _authCredentialsModel?.accessToken;
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


  Future<void> storeAccessToken(String token) async {
    token = removeBearer(token);
    await secureStorageService.setData(
      key: SecureStorageKeys.accessToken,
      value: token,
    );
    _authCredentialsModel?.accessToken = token;
  }



  Future<void> storeTokens({
    required String accessToken,
  }) async {
    accessToken = removeBearer(accessToken);

    await Future.wait([
      storeAccessToken(accessToken),
    ]);
    await init();
  }

  Future<void> clearTokens() async {
    await secureStorageService.clear();
    _authCredentialsModel?.accessToken = null;
    _authCredentialsModel = null;
  }

  bool userIsAuthenticated() {
    bool isLoggedIn = _authCredentialsModel?.accessToken != null;
    return isLoggedIn;
  }
}

class AuthCredentials {
  String? accessToken;

  AuthCredentials._({required this.accessToken});
}
