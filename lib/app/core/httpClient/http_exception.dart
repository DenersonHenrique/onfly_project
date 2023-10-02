import 'package:equatable/equatable.dart';

import 'http_status.dart';

abstract class IHttpException extends Equatable {
  final HttpStatus? status;

  final String message;

  final dynamic data;

  const IHttpException(
    this.status, {
    this.data,
    this.message = '',
  });

  @override
  List<Object?> get props => [status, data, message];
}

class BadRequestException extends IHttpException {
  const BadRequestException(
      {HttpStatus? status, super.data, super.message = ''})
      : super(status ?? HttpStatus.badRequest);
}

class ServerErrorException extends IHttpException {
  const ServerErrorException({super.message = ''})
      : super(HttpStatus.serverError);
}

class UnprocessableEntityException extends IHttpException {
  const UnprocessableEntityException({super.data, super.message = ''})
      : super(HttpStatus.unprocessableEntity);
}

class UnauthorizedException extends IHttpException {
  const UnauthorizedException({super.data, super.message = ''})
      : super(HttpStatus.unauthorized);
}

class TimeoutException extends IHttpException {
  const TimeoutException({super.message = ''})
      : super(HttpStatus.requestTimeout);
}

class UnknownConnectionError extends IHttpException {
  const UnknownConnectionError({super.data, super.message = ''}) : super(null);
}
