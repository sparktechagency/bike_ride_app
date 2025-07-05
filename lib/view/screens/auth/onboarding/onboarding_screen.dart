import 'package:bike_ride_app/app/routes/app_routes.dart';
import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/gen/assets.gen.dart';
import 'package:bike_ride_app/gen/fonts.gen.dart';
import 'package:bike_ride_app/view/screens/auth/onboarding/model/onboarding_model.dart';
import 'package:bike_ride_app/view/widgets/custom_button.dart';
import 'package:bike_ride_app/view/widgets/custom_container.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:bike_ride_app/view/widgets/dummy_widget.dart';
import 'package:bike_ride_app/view/widgets/title_with_subtitle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // late final OnBoardingModel onBoardingData;
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<OnBoardingModel> onboardingDataList = [
    OnBoardingModel(
      title: 'Plan Group Rides Easily',
      subTitle:
          "Create or join rider groups, schedule routes, and plan every ride together with your biking community.",
      image: Assets.icons.onBoardingIcon1.svg(height: 278.h, width: 278.w),
    ),
    OnBoardingModel(
      title: 'Live Ride Tracking',
      subTitle:
          "See every rider's location in real time during a ride, stay connected, and never lose track of your team.",
      image: Assets.icons.onBoardingIcon2.svg(height: 278.h, width: 278.w),
    ),
    OnBoardingModel(
      title: "Stay Safe & Ride Smart",
      subTitle:
          "Use credits to schedule rides. In case of emergencies, tap the SOS button to call your saved emergency contact instantly.",
      image: Assets.icons.onBoardingIcon3.svg(height: 278.h, width: 278.w),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.r),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 150.h),
              // Assets.icons.onBoardingIcon1.svg(height: 278.h, width: 278.w),
              onboardingDataList[_currentPage].image,
              SizedBox(height: 60.h),
              TitleWithSubTItleWidget(
                title: onboardingDataList[_currentPage].title,
                subTitle: onboardingDataList[_currentPage].subTitle,
              ),
              SizedBox(height: 40.h),

              // CustomButton(onPressed: (){},label: 'Next',radius: 12.sp,),
              // CustomButton(
              //   label: "Tap Me",
              //   onPressed: () {},
              //   elevation: true,
              // ),
              CustomButton(
                label:_currentPage==2?"Get Started": "Next",
                onPressed: () {
                  if (_currentPage < onboardingDataList.length - 1) {
                    setState(() {
                      _currentPage++;
                    });
                  } else {
                    // Optionally navigate to next screen
                    Get.offAllNamed(AppRoutes.signUpScreen); // or any other route
                  }
                },
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(onboardingDataList.length, (index) {
                  return CustomContainer(
                    height: 6.h,
                    width: 30.w,
                    color:_currentPage==index? AppColors.primaryColor:AppColors.primaryColor.withOpacity(.2),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
