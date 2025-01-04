import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tasky/core/routing/app_routes.dart';
import 'package:tasky/core/routing/routing.dart';

class Tasky extends StatelessWidget {
  final AppRoutes appRouter;
  const Tasky({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.login,
        title: 'tasky',
      ),
    );
  }
}
