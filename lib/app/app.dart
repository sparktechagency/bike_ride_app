import 'package:bike_ride_app/app/routes/app_routes.dart';
import 'package:bike_ride_app/app/theme/app_theme.dart';
import 'package:bike_ride_app/view/screens/auth/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 852),
      builder: (context, child) {
        return GetMaterialApp(
            title: 'Themikg',
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
            initialRoute: AppRoutes.splashScreen,
            getPages: AppRoutes.routes,
            // themeMode: ThemeMode.light,
            // theme: ThemeData.dark(useMaterial3: true),
            theme: AppThemeData.lightThemeData
        );
      },
    );
  }
}
