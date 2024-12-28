import 'package:tasky/core/networking/ServicesApi.dart';
import 'package:tasky/core/networking/api_result.dart';
import 'package:tasky/core/networking/error_handling.dart';
import 'package:tasky/features/home/data/models/get_tasks.response.dart';

class HomeRepo {
  final ServicesApi servicesApi;
  HomeRepo(this.servicesApi);

  Future<ApiResult<List<GetTasksResponse>>> getTasks(pageNum) async {
    try {
      final response = await servicesApi.getTasks(pageNum);
      return ApiResult.success(response);
    } catch (er) {
      return ApiResult.failure(
        ErrorHandler.handle(er),
      );
    }
  }
}
