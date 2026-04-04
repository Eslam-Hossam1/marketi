String removeBearer(String token) {
  if (token.startsWith('Bearer ')) {
    return token.substring(7);
  }
  return token;
}
