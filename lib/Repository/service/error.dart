class AuthException implements Exception {
  final int statusCode;
  final String message;

  AuthException({required this.statusCode,required this.message});

  @override
  String toString() {
    return 'AuthException: $statusCode - $message';
  }
}
