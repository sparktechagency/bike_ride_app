import 'package:bike_ride_app/app/routes/app_routes.dart';
import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/gen/assets.gen.dart';
import 'package:bike_ride_app/view/widgets/custom_button.dart';
import 'package:bike_ride_app/view/widgets/custom_global_app_bar.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:bike_ride_app/view/widgets/custom_text_field.dart';
import 'package:bike_ride_app/view/widgets/dummy_widget.dart';
import 'package:bike_ride_app/view/widgets/title_with_subtitle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: SizedBox.shrink(),
        title: CustomText(text: 'Reset', fontSize: 18.sp),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // SizedBox(height: 71.h),
                  // Assets.images.appLogo.image(height: 98.h, width: 98.w),
                  Assets.icons.authLogo.svg(height: 98.h, width: 105.w),
                  TitleWithSubTItleWidget(
                    title: "Reset Your Password",
                    subTitle: 'Please reset your password',
                  ),
                  SizedBox(height: 80.h),
                  CustomTextField(
                    controller: _passwordTEController,
                    filColor: AppColors.secondaryColor,
                    hintText: 'Password',
                    isPassword: true,
                    // prefixIcon: Assets.icons.passwordIcon.svg(),
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    controller: _confirmPasswordTEController,
                    filColor: AppColors.secondaryColor,
                    hintText: 'Confirm password',
                    validator: (value) {
                      if (value != _passwordTEController.text) {
                        return "Password do not match";
                      }
                      return null;
                    },
                    isPassword: true,
                    // prefixIcon: Assets.icons.passwordIcon.svg(),
                  ),
                  SizedBox(height: 148.h),
                  CustomButton(
                    onPressed: _onTapSignInButton,
                    label: 'Reset',
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {
    if (_formKey.currentState!.validate()) {
      // Get.toNamed(AppRoutes.forgetPasswordOtpScreen);
      showDialog(
        // barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                children: [
                  // Assets.icons.alertDialogImage.svg(),
                  Assets.images.confirmImage.svg(height: 180.h, width: 180.w),
                  SizedBox(height: 8.h),
                  TitleWithSubTItleWidget(
                    title: 'Password changed',
                    titleColor: Colors.black,
                    subTitle: 'Your password has been changed successfully',
                  ),
                  SizedBox(height: 32.h),
                  CustomButton(
                    onPressed: () {
                      Get.offAllNamed(AppRoutes.signInScreen);
                    },
                    label: 'Back to Sign In',
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  void _onTapSignUpButton() {
    Get.offNamed(AppRoutes.signUpScreen);
  }
}
