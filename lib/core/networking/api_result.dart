import 'package:tasky/core/networking/error_handling.dart';

///  API results with a generic type.
abstract class ApiResult<T> {
  const ApiResult();

  factory ApiResult.success(T data) = Success<T>;

  factory ApiResult.failure(ErrorHandler errorHandler) = Failure<T>;
}

/// Success case containing data.
class Success<T> extends ApiResult<T> {
  final T data;

  const Success(this.data);
}

/// Failure case containing an error handler.
class Failure<T> extends ApiResult<T> {
  final ErrorHandler errorHandler;

  const Failure(this.errorHandler);
}
