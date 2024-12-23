import 'package:bloc/bloc.dart';
import 'package:tasky/core/networking/error_handling.dart';

import 'package:tasky/features/signin/data/models/signIn_request.dart';

import '../data/repo/signIn_repo.dart';
import 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SigninRepo signinRepo;

  SignInCubit({required this.signinRepo}) : super(SignInInitial());

  Future<void> signIn(SigninRequest signinRequest) async {
    emit(SignInLoading());
    try {
      final result = await signinRepo.signIn(signinRequest);
      result.when(
        success: (response) => emit(SignInSuccess(response)),
        failure: (errorHandler) {
          String errorMessage =
              errorHandler.apiErrorModel.message ?? "Unknown Error";
          // Check for specific errors and update message
          if (errorHandler.apiErrorModel.statusCode ==
              ResponseCode.UNAUTORISED) {
            errorMessage = "Invalid credentials. Please try again.";
          }
          emit(SignInFailure(errorMessage));
        },
      );
    } catch (error) {
      emit(SignInFailure("An unexpected error occurred. Please try again."));
    }
  }
}
