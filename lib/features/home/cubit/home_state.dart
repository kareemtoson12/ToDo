part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

// Initial state
final class HomeInitial extends HomeState {}

// Loading state
final class HomeLoading extends HomeState {}

// Empty state
final class HomeEmpty extends HomeState {}

// Error state
final class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}

// Refresher state (e.g., refreshing data)
final class HomeRefreshing extends HomeState {}

// Infinite scroll state
final class HomeInfiniteScroll extends HomeState {
  final List<Object> items; // Replace `Object` with your specific item type
  final bool hasMore;

  const HomeInfiniteScroll({required this.items, required this.hasMore});

  @override
  List<Object> get props => [items, hasMore];
}
