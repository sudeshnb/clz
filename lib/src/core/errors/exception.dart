class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}

class ServerException implements Exception {
  final String message;
  final int? statusCode;

  const ServerException({required this.message, this.statusCode});
}

class TokenException implements Exception {
  final String message;
  const TokenException({required this.message});
}

class SocialLoginException implements Exception {
  final String message;
  const SocialLoginException(this.message);
}

class PaymentException implements Exception {
  final String message;
  PaymentException(this.message);

  @override
  String toString() => message;
}
