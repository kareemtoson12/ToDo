import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasky/features/profile/data/models/profile_response.dart';
import 'package:tasky/features/profile/data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.getProfileRepo}) : super(ProfileInitial());
  final ProfileRepo getProfileRepo;

//get profile user data

  void getProfileData() async {
    emit(ProfileLoading());
    try {
      final result = await getProfileRepo.getProfileData();
      result.when(
        success: (ProfileResponse response) {
          emit(ProfileLoaded(profile: response));
        },
        failure: (errorHandler) {
          String errorMessage = errorHandler.apiErrorModel.message ??
              "An unknown error occurred. Please try again.";
          emit(ProfileError(errorMessage: errorMessage));
        },
      );
    } catch (error) {
      emit(ProfileError(
          errorMessage: "An unexpected error occurred. Please try again."));
    }
  }
}
