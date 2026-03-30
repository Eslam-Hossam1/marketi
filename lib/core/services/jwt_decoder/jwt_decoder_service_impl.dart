import 'package:jwt_decoder/jwt_decoder.dart';

import 'jwt_decoder_service.dart';

class JwtDecoderServiceImpl implements JwtDecoderService {
  const JwtDecoderServiceImpl();
  @override
  Map<String, dynamic>? decodeToken({required String? token}) {
    if (token == null) return null;
    var result = JwtDecoder.decode(token);
    return result;
  }
}
