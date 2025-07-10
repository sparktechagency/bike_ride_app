import 'package:bike_ride_app/app/routes/app_routes.dart';
import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/gen/assets.gen.dart';
import 'package:bike_ride_app/view/widgets/custom_container.dart';
import 'package:bike_ride_app/view/widgets/custom_dialog.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:bike_ride_app/view/widgets/list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final List<Map<String, dynamic>> profileItems = [
    {'icon': Assets.icons.changePasswordIcon.path, 'name': "Change Password"},
    {'icon': Assets.icons.termsIcon.path, 'name': "Terms & Conditions"},
    {'icon': Assets.icons.policy.path, 'name': "Privacy Policy"},
    {'icon': Assets.icons.aboutIcon.path, 'name': "About Us"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Settings",
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Center(
            child: Column(
              children: [
                Column(
                  children: List.generate(profileItems.length, (index) {
                    final items = profileItems[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: ListTileWidget(
                        onTap: () {
                          if (index == 0) {
                            Get.toNamed(AppRoutes.changePasswordScreen);
                          } else if (index == 1) {
                            Get.toNamed(AppRoutes.termsConditionScreen);
                          } else if (index == 2) {
                            Get.toNamed(AppRoutes.privacyPolicyScreen);
                          } else if (index == 3) {
                            Get.toNamed(AppRoutes.aboutUsScreen);
                          }
                        },
                        leading: SvgPicture.asset(items['icon']),
                        title: items['name'],
                        titleColor: Colors.white,
                        bgColor: AppColors.grey400,
                      ),
                    );
                  }),
                ),
                SizedBox(height: 288.h),
                CustomContainer(
                  onTap: () {
                    customPopUpWidget(
                      context: context,
                      title: "Delete Account",
                      subtitle: "Do you want to delete your account?",
                      // latButtonBgColor: AppColors.primaryColor,
                      onPressedLastButton: () {
                        Get.offAllNamed(AppRoutes.signInScreen);
                      },
                      firstButton: 'Cancel',
                      lastButton: 'Delete',
                    );
                  },
                  alignment: Alignment.center,
                  height: 48.h,
                  width: 200.w,
                  bordersColor: Color(0xFF474747),
                  borderWidth: 8,
                  radiusAll: 16.r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      // Assets.icons.logoutIcon.svg(),
                      Icon(Icons.delete_outline, color: AppColors.errorColor),
                      CustomText(
                        text: 'Delete Account',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
