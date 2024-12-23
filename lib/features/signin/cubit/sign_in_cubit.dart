import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasky/core/networking/ServicesApi.dart';
import 'package:tasky/core/networking/error_handling.dart';
import 'package:tasky/core/networking/error_model.dart';
import 'package:tasky/features/login/data/models/login_request.dart';
import 'package:tasky/features/signin/data/models/signIn_request.dart';
import 'package:tasky/features/signin/data/models/signIn_response.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final ServicesApi servicesApi;
  SignInCubit({required this.servicesApi}) : super(SignInInitial());

  // sign in function

  Future<void> signIn(String phone, String password, String displayName,
      String level, String address, int experienceYears) async {
    emit(SignInLoading());
    try {
      final signinRequest = SigninRequest(
          phone: phone,
          password: password,
          displayName: displayName,
          experienceYears: experienceYears,
          address: address,
          level: level);
      final response = await servicesApi.signIn(signinRequest);
      if (response != null) {
        emit(SignInSuccess(response));
      } else {
        emit(SignInFailure());
      }
    } catch (error) {
      emit(SignInFailure());
    }
  }
}
