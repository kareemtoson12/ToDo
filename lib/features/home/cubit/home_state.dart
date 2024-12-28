part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

// Initial state
final class HomeInitial extends HomeState {}

// GetTasks Loading state
final class GetTasksLoading extends HomeState {}

// Empty state
final class GetTasksEmpty extends HomeState {}

// Error state
final class GetTasksError extends HomeState {
  final String message;

  const GetTasksError(this.message);

  @override
  List<Object> get props => [message];
}

// Success state
final class GetTasksSuccess extends HomeState {
  final List<GetTasksResponse> tasks;

  const GetTasksSuccess(this.tasks);

  @override
  List<Object> get props => [tasks];
}
