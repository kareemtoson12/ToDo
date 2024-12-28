import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasky/features/home/data/models/get_tasks.response.dart';
import 'package:tasky/features/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitial());
  final HomeRepo homeRepo;

  // Store all tasks
  List<GetTasksResponse> allTasks = [];

  void loadTasks(int pageNum) async {
    emit(GetTasksLoading());
    try {
      final result = await homeRepo.getTasks(pageNum);
      result.when(
        success: (List<GetTasksResponse> response) {
          if (response.isEmpty) {
            emit(GetTasksEmpty());
          } else {
            allTasks = response; // Store all tasks locally
            emit(GetTasksSuccess(response)); // Emit all tasks initially
          }
        },
        failure: (errorHandler) {
          String errorMessage = errorHandler.apiErrorModel.message ??
              "An unknown error occurred. Please try again.";
          emit(GetTasksError(errorMessage));
        },
      );
    } catch (error) {
      emit(GetTasksError("An unexpected error occurred. Please try again."));
    }
  }

  // Filter tasks locally based on task type
  void filterTasks(String filter) {
    if (filter == "All") {
      emit(GetTasksSuccess(allTasks)); // Show all tasks
    } else {
      final filteredTasks =
          allTasks.where((task) => task.status == filter).toList();
      if (filteredTasks.isEmpty) {
        emit(GetTasksEmpty()); // No tasks match the filter
      } else {
        emit(GetTasksSuccess(filteredTasks));
      }
    }
  }
}
