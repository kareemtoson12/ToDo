import 'package:flutter/material.dart';
import 'package:tasky/core/di/dependicy_injection.dart';
import 'package:tasky/core/networking/ServicesApi.dart';
import 'package:tasky/core/networking/dio_refactory.dart';

import 'package:tasky/core/routing/routes.dart';
import 'package:tasky/features/login/data/models/login_request.dart';

import 'package:tasky/tasky.dart';

void main() async {
  setUpGetIt();

  final dio = DioFactory.getDio();

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
