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

// RefreshToken Loading state
final class RefreshTokenLoading extends HomeState {}

// RefreshToken Success state
final class RefreshTokenSuccess extends HomeState {
  final RefreshTokenResponse refreshTokenResponse;

  const RefreshTokenSuccess(this.refreshTokenResponse);

  @override
  List<Object> get props => [refreshTokenResponse];
}

// RefreshToken Error state
final class RefreshTokenError extends HomeState {
  final String message;

  const RefreshTokenError(this.message);

  @override
  List<Object> get props => [message];
}
