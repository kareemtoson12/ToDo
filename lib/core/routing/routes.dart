import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/di/dependicy_injection.dart';
import 'package:tasky/core/routing/app_routes.dart';
import 'package:tasky/features/login/cubit/login_cubit.dart';
import 'package:tasky/features/login/view.dart';
import 'package:tasky/features/onboarding/view.dart';
import 'package:tasky/features/signin/view.dart';
import 'package:tasky/features/splash/view.dart';

class AppRoutes {
  Route? generateRoute(RouteSettings screen) {
    switch (screen.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (context) => const Onboarding());
      case Routes.signUp:
        return MaterialPageRoute(builder: (context) => const SignIn());
      case Routes.login:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getit<LoginCubit>(),
                  child: LoginScreen(),
                ));
      default:
        return null;
    }
  }
}
