import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:tasky/core/networking/ServicesApi.dart';
import 'package:tasky/core/networking/dio_refactory.dart';
import 'package:tasky/features/login/cubit/login_cubit.dart';
import 'package:tasky/features/login/data/repo/login_repo.dart';

final getit = GetIt.instance;
Future<void> setUpGetIt() async {
  //Dio
  Dio dio = DioFactory.getDio();
  getit.registerLazySingleton<ServicesApi>(() => ServicesApi(dio));
  //login
  getit.registerLazySingleton<LoginRepo>(
      () => LoginRepo(servicesInstance: getit()));

  getit.registerFactory<LoginCubit>(() => LoginCubit(servicesApi: getit()));
}
