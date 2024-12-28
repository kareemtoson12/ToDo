import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  // Example method to load initial data
  Future<void> loadData() async {
    emit(HomeLoading());
    try {
      final items = await fetchData(); // Replace with your data fetching logic
      if (items.isEmpty) {
        emit(HomeEmpty());
      } else {
        emit(HomeInfiniteScroll(items: items, hasMore: true));
      }
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  // Example method to refresh data
  Future<void> refreshData() async {
    emit(HomeRefreshing());
    try {
      final items = await fetchData(); // Replace with your data fetching logic
      if (items.isEmpty) {
        emit(HomeEmpty());
      } else {
        emit(HomeInfiniteScroll(items: items, hasMore: true));
      }
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  // Example method for infinite scroll
  Future<void> loadMore(List<Object> currentItems) async {
    emit(HomeInfiniteScroll(items: currentItems, hasMore: true));
    try {
      final newItems =
          await fetchMoreData(); // Replace with your data fetching logic
      if (newItems.isEmpty) {
        emit(HomeInfiniteScroll(items: currentItems, hasMore: false));
      } else {
        emit(HomeInfiniteScroll(items: currentItems + newItems, hasMore: true));
      }
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  // Mock method to simulate data fetching
  Future<List<Object>> fetchData() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return List.generate(
        10, (index) => 'Item $index'); // Replace with your actual items
  }

  // Mock method to simulate fetching more data
  Future<List<Object>> fetchMoreData() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return List.generate(
        5, (index) => 'New Item $index'); // Replace with your actual items
  }
}
