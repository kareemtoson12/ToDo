import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tasky/core/networking/ServicesApi.dart';
import 'package:tasky/features/login/data/models/login_request.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final ServicesApi servicesApi;

  LoginCubit({required this.servicesApi}) : super(LoginInitial());

  Future<void> login(String phoneNumber, String password) async {
    emit(LoginLoading());

    try {
      final loginRequest = LoginRequest(phoneNumber, password);
      final response = await servicesApi.login(loginRequest);

      if (response != null) {
        emit(LoginSucess(
          response.id,
          response.accessToken,
          response.refreshToken,
        ));
      } else {
        emit(LoginError(ErrorHandler('Invalid response from server')));
      }
    } catch (error) {
      emit(LoginError(ErrorHandler(error.toString())));
    }
  }
}
