enum StatusCode {
  success200(200), // success with data
  successNoContent201(201), // success with no data (no content)
  badRequest400(400), // failure, API rejected request
  unauthorized401(401), // failure, user is not authorized
  forbidden403(403), // failure, API rejected request
  notFound404(404), // failure, not found
  apiLogicError422(422), // API logic error
  internalServerError500(500), // failure, crash in server side
  badGateway502(502), // failure, gateway error
  serviceUnavailable503(503), // failure, service unavailable
  gatewayTimeout504(504), // failure, gateway timeout

  // local status code
  connectTimeout(-1),
  cancel(-2),
  receiveTimeout(-3),
  sendTimeout(-4),
  cacheError(-5),
  noInternetConnection(-6),
  badCertificate(-7),
  unknownError(-8);

  final int code;
  const StatusCode(this.code,);
}