import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'SERVER_FAILURE']);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'An unknown exception occurred.']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'CACHE_FAILURE']);
}

class ValidationFailure extends Failure {
  const ValidationFailure([super.message = 'VALIDATION_FAILURE']);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = 'NOTFOUND_FAILURE']);
}

class TokenExpiredFailure extends Failure {
  const TokenExpiredFailure([super.message = 'TOKEN_FAILURE']);
}

class SocialLoginFailure extends Failure {
  const SocialLoginFailure([super.message = 'SOCIALLOGIN_FAILURE']);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'UNKNOWN_FAILURE']);
}

class InvalidInputFailure extends Failure {
  const InvalidInputFailure([super.message = 'INVALIDINPUT_FAILURE']);
}

class LogOutFailure extends Failure {
  const LogOutFailure([super.message = 'LOGOUT_FAILURE']);
}

class PaymentFailure extends Failure {
  const PaymentFailure([super.message = 'PAYMENT_FAILURE']);
}

class InvalidVoucherFailure extends Failure {
  const InvalidVoucherFailure(super.message);
}
