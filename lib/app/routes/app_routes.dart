import 'package:bike_ride_app/rides/create_rides/create_rides_screen.dart';
import 'package:bike_ride_app/rides/joined_riders/joined_riders_screen.dart';
import 'package:bike_ride_app/rides/rides_screen.dart';
import 'package:bike_ride_app/view/screens/auth/forget_password/forget_password_email.dart';
import 'package:bike_ride_app/view/screens/auth/forget_password/forget_password_otp_screen.dart';
import 'package:bike_ride_app/view/screens/auth/onboarding/onboarding_screen.dart';
import 'package:bike_ride_app/view/screens/auth/reset_password/reset_password_screen.dart';
import 'package:bike_ride_app/view/screens/auth/sign_in/sign_in_screen.dart';
import 'package:bike_ride_app/view/screens/auth/sign_up/sign_up_screen.dart';
import 'package:bike_ride_app/view/screens/auth/splash_screen/splash_screen.dart';
import 'package:bike_ride_app/view/screens/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:bike_ride_app/view/screens/groups/create_group/create_group_screen.dart';
import 'package:bike_ride_app/view/screens/groups/group_details/all_member/all_member_screen.dart';
import 'package:bike_ride_app/view/screens/groups/group_details/group_details_screen.dart';
import 'package:bike_ride_app/view/screens/groups/group_details/invite_members/invite_members_screen.dart';
import 'package:bike_ride_app/view/screens/groups/group_details/media/media_screen.dart';
import 'package:bike_ride_app/view/screens/groups/group_message/group_message_screen.dart';
import 'package:bike_ride_app/view/screens/groups/groups_screen.dart';
import 'package:bike_ride_app/view/screens/groups/my_groups/my_groups_details/my_group_details_screen.dart';
import 'package:bike_ride_app/view/screens/groups/my_groups/my_groups_screen.dart';
import 'package:bike_ride_app/view/screens/home/home_screen.dart';
import 'package:bike_ride_app/view/screens/home/notification/notification_screen.dart';
import 'package:bike_ride_app/view/screens/profile/profile_screen.dart';
import 'package:bike_ride_app/view/screens/rides_schedule/rides_schedule_screen.dart';
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
  static const String notificationsScreen = '/notificationsScreen';
  static const String groupScreen = '/groupScreen';
  static const String myGroupScreen = '/myGroupScreen';
  static const String groupMessageScreen = '/groupMessageScreen';
  static const String groupDetailsScreen = '/groupDetailsScreen';
  static const String allMemberScreen = '/allMemberScreen';
  static const String inviteMemberScreen = '/inviteMemberScreen';
  static const String mediaScreen = '/mediaScreen';
  static const String createGroupScreen = '/createGroupScreen';
  static const String myGroupDetailsScreen = '/myGroupDetailsScreen';
  static const String rideScheduleScreen = '/rideScheduleScreen';
  static const String rideScreen = '/rideScreen';
  static const String createRideScreen = '/createRideScreen';
  static const String joinedRideScreen = '/joinedRideScreen';
  static const String profileScreen = '/profileScreen';

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
    GetPage(name: groupScreen, page: () => GroupsScreen()),
    GetPage(name: myGroupScreen, page: () => MyGroupsScreen()),
    GetPage(name: groupMessageScreen, page: () => InboxMessageScreen()),
    GetPage(name: groupDetailsScreen, page: () => GroupDetailsScreen()),
    GetPage(name: allMemberScreen, page: () => AllMemberScreen()),
    GetPage(name: inviteMemberScreen, page: () => InviteMembersScreen()),
    GetPage(name: mediaScreen, page: () => MediaScreen()),
    GetPage(name: createGroupScreen, page: () => CreateGroupScreen()),
    GetPage(name: myGroupDetailsScreen, page: () => MyGroupDetailsScreen()),
    GetPage(name: rideScheduleScreen, page: () => RidesScheduleScreen()),
    GetPage(name: rideScreen, page: () => RidesScreen()),
    GetPage(name: createRideScreen, page: () => CreateRidesScreen()),
    GetPage(name: joinedRideScreen, page: () => JoinedRidersScreen()),
    GetPage(name: profileScreen, page: () => ProfileScreen()),
  ];
}
