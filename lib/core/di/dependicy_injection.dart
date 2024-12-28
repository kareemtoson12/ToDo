import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:tasky/core/networking/ServicesApi.dart';
import 'package:tasky/core/networking/dio_factory.dart';
import 'package:tasky/features/login/cubit/login_cubit.dart';
import 'package:tasky/features/login/data/repo/login_repo.dart';
import 'package:tasky/features/signin/cubit/sign_in_cubit.dart';
import 'package:tasky/features/signin/data/repo/signIn_repo.dart';

final getit = GetIt.instance;
Future<void> setUpGetIt() async {
  //Dio
  Dio dio = DioFactory.getDio();
  getit.registerLazySingleton<ServicesApi>(() => ServicesApi(dio));
  //login
  getit.registerLazySingleton<LoginRepo>(
      () => LoginRepo(servicesInstance: getit()));

  getit.registerFactory<LoginCubit>(() => LoginCubit(servicesApi: getit()));

  //sign in

  getit.registerLazySingleton<SigninRepo>(
      () => SigninRepo(servicesInstance: getit()));
  getit.registerFactory<SignInCubit>(() => SignInCubit(signinRepo: getit()));

  //home
}
