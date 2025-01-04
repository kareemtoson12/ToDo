import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:tasky/core/networking/constants.dart';
import 'package:tasky/features/home/data/models/get_tasks.response.dart';
import 'package:tasky/features/home/data/models/refresh_token.dart';
import 'package:tasky/features/login/data/models/login_request.dart';
import 'package:tasky/features/login/data/models/login_response.dart';
import 'package:tasky/features/signin/data/models/signIn_request.dart';
import 'package:tasky/features/signin/data/models/signIn_response.dart';
import 'package:tasky/features/task_details/data/model/delete_response.dart';

part 'ServicesApi.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ServicesApi {
  factory ServicesApi(Dio dio, {String baseUrl}) = _ServicesApi;

  ///Authentication

  //Login
  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequest loginRequestBody);

//signIn

  @POST(ApiConstants.sigIn)
  Future<SigninResponse> signIn(@Body() SigninRequest signInRequestBody);

  //get list of  tasks

  @GET(ApiConstants.getTasks)
  Future<List<GetTasksResponse>> getTasks(@Query("page") int pageNum);
  // update token
  @GET(ApiConstants.refreshTToken)
  Future<RefreshTokenResponse> refreshToken(@Query("token") String token);
  //delete task using id
  @DELETE("/todos/{id}")
  Future<TaskDelete> deleteTask(@Path("id") String id);
}
