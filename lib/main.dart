import 'package:flutter/material.dart';
import 'package:tasky/core/di/dependicy_injection.dart';
import 'package:tasky/core/networking/ServicesApi.dart';
import 'package:tasky/core/networking/dio_factory.dart';

import 'package:tasky/core/routing/routing.dart';

import 'package:tasky/tasky.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpGetIt();
  final dio = DioFactory.getDio();

  // Log interceptors
  print("Interceptors: ${dio.interceptors}");

  // Create an instance of ApiServices
  final api = ServicesApi(dio);

  // Test the API
  try {
    final response = await api.getTasks(1);
    print("Response: $response");
  } catch (e) {
    print("Error: $e");
  }
  runApp(Tasky(
    appRouter: AppRoutes(),
  ));
}

/*  final dio = DioFactory.getDio();

  // Log interceptors
  print("Interceptors: ${dio.interceptors}");

  // Create an instance of ApiServices
  final api = ServicesApi(dio);

  // Test the API
  try {
    final loginRequest = LoginRequest("+201010558269", "123456");
    final response = await api.login(loginRequest);
    print("Response: $response");
  } catch (e) {
    print("Error: $e");
  }
 */

/*  final dio = DioFactory.getDio();

  // Log interceptors
  print("Interceptors: ${dio.interceptors}");

  // Create an instance of ApiServices
  final api = ServicesApi(dio);

  // Test the API
  try {
    final loginRequest = SigninRequest(
        phone: "+201010358995",
        password: "123456",
        displayName: "toson mohamed",
        experienceYears: 10,
        address: "Mit ghamr , Dakahlia , Egypt",
        level: "senior");
    SigninResponse response = await api.signIn(loginRequest);
    print("Response: $response");
  } catch (e) {
    print("Error: $e");
  } */
