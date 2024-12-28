import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasky/features/home/data/models/get_tasks.response.dart';
import 'package:tasky/features/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitial());
  final HomeRepo homeRepo;

  void loadTasks(int pageNum) async {
    emit(GetTasksLoading());
    try {
      final result = await homeRepo.getTasks(pageNum);
      result.when(
        success: (List<GetTasksResponse> response) {
          // Emit success state with the fetched tasks
          if (response.isEmpty) {
            emit(GetTasksEmpty());
          } else {
            emit(GetTasksSuccess(response));
          }
        },
        failure: (errorHandler) {
          // Handle failure and emit error state
          String errorMessage = errorHandler.apiErrorModel.message ??
              "An unknown error occurred. Please try again.";
          emit(GetTasksError(errorMessage));
        },
      );
    } catch (error) {
      // Catch unexpected errors and emit error state
      emit(GetTasksError("An unexpected error occurred. Please try again."));
    }
  }
}
