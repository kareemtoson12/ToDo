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
  final LoginResponse loginResponse;
  LoginSucess(this.loginResponse);
}

final class LoginError extends LoginState {
  final String error;
  LoginError(this.error);
}
