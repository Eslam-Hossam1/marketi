abstract interface class JwtDecoderService {
  Map<String, dynamic>? decodeToken({required String? token});
}
