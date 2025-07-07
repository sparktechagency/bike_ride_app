import 'package:bike_ride_app/view/screens/auth/forget_password/forget_password_email.dart';
import 'package:bike_ride_app/view/screens/auth/forget_password/forget_password_otp_screen.dart';
import 'package:bike_ride_app/view/screens/auth/onboarding/onboarding_screen.dart';
import 'package:bike_ride_app/view/screens/auth/reset_password/reset_password_screen.dart';
import 'package:bike_ride_app/view/screens/auth/sign_in/sign_in_screen.dart';
import 'package:bike_ride_app/view/screens/auth/sign_up/sign_up_screen.dart';
import 'package:bike_ride_app/view/screens/auth/splash_screen/splash_screen.dart';
import 'package:bike_ride_app/view/screens/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:bike_ride_app/view/screens/home/home_screen.dart';
import 'package:bike_ride_app/view/screens/home/notification/notification_screen.dart';
import 'package:bike_ride_app/view/screens/set_up_profile/set_up_profile_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splashScreen = '/splashScreen';
  static const String onboardingScreen = '/onboardingScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String signInScreen = '/signInScreen';
  static const String forgetPasswordEmailScreen = '/forgetPasswordEmailScreen';
  static const String forgetPasswordOtpScreen = '/forgetPasswordOtpScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';
  static const String setUpProfileScreen = '/setUpProfileScreen';
  static const String bottomNavBarScreen = '/bottomNavBarScreen';
  static const String homeScreen = '/homeScreen';

  // static const String commentScreen = '/commentScreen';
  static const String notificationsScreen = '/notificationsScreen';

  // static const String exploreScreen = '/exploreScreen';
  // static const String peopleByLocationScreen = '/peopleByLocationScreen';
  // static const String universeContentScreen = '/universeContentScreen';
  // static const String orbitScreen = '/orbitScreen';
  // static const String orbitPostScreen = '/orbitPostScreen';
  // static const String reelsScreen = '/reelsScreen';

  static List<GetPage> get routes => [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: onboardingScreen, page: () => OnboardingScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),
    GetPage(name: signInScreen, page: () => SignInScreen()),
    GetPage(name: forgetPasswordEmailScreen, page: () => ForgetPasswordEmail()),
    GetPage(
      name: forgetPasswordOtpScreen,
      page: () => ForgetPasswordOtpScreen(),
    ),
    GetPage(name: resetPasswordScreen, page: () => ResetPasswordScreen()),
    GetPage(name: setUpProfileScreen, page: () => SetUpProfileScreen()),
    GetPage(name: bottomNavBarScreen, page: () => BottomNavBarScreen()),
    GetPage(name: homeScreen, page: () => HomeScreen()),
    GetPage(name: notificationsScreen, page: () => NotificationScreen()),
    // GetPage(name: reelsScreen, page: () => ReelsScreen(reelsList: reelsList)),
  ];
}
