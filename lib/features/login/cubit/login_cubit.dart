import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:tasky/features/login/data/models/login_request.dart';
import 'package:tasky/features/login/data/models/login_response.dart';
import 'package:tasky/features/login/data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo servicesApi;

  LoginCubit({required this.servicesApi}) : super(LoginInitial());

  Future<void> login(LoginRequest loginRequest) async {
    emit(LoginLoading());

    try {
      final result = await servicesApi.login(loginRequest);
      result.when(
        success: (response) => emit(LoginSucess(response)),
        failure: (errorHandler) {
          String errorMessage =
              errorHandler.apiErrorModel.message ?? "Unknown Error";
          // Check for specific errors and update message

          emit(LoginError(errorMessage));
        },
      );
    } catch (error) {
      emit(LoginError(
          "An unexpected error occurred. Please try again.${error}"));
    }
  }
}
