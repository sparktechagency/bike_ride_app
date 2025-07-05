import 'package:bike_ride_app/app/routes/app_routes.dart';
import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/view/widgets/custom_container.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:bike_ride_app/view/widgets/splash_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart' show Assets;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _moveToNextScreen() async{
    await Future.delayed(Duration(seconds: 3));
    Get.offAllNamed(AppRoutes.onboardingScreen);
  }

  @override
  void initState() {
    _moveToNextScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent),
    );
    return Scaffold(
      body: Stack(
        children: [
          CustomContainer(
            height: double.infinity,
            width: double.infinity,
            linearColors: [
              Color(0xFF90FFFF),
              Color(0xFFFFFFFF),
              Color(0xFFFFFFFF),
              Color(0xFFFFFFFF),
            ],
          ),
          Center(
            child: Column(
              children: [
                SizedBox(height: 287.h),
                Assets.icons.splashIcon.svg(height: 170.h, width: 200.w),
                CustomText(
                  text: 'Plan your ride. Track your crew. Ride safer.',
                  color: AppColors.primaryColor,
                  // fontSize: 20.sp,
                ),
                SizedBox(height: 208.h),
                SemiCircleLoader(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
