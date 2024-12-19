part of 'login_cubit.dart';

class ErrorHandler {
  final String message;

  ErrorHandler(this.message);
}

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSucess extends LoginState {
  final String _id;
  final String access_token;
  final String refresh_token;

  LoginSucess(this._id, this.access_token, this.refresh_token);
}

final class LoginError extends LoginState {
  final ErrorHandler errorHandler;
  LoginError(this.errorHandler);
}
