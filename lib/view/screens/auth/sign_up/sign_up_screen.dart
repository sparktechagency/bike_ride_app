import 'package:bike_ride_app/app/routes/app_routes.dart';
import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/gen/assets.gen.dart';
import 'package:bike_ride_app/gen/fonts.gen.dart';
import 'package:bike_ride_app/view/widgets/custom_button.dart';
import 'package:bike_ride_app/view/widgets/custom_global_app_bar.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:bike_ride_app/view/widgets/custom_text_field.dart';
import 'package:bike_ride_app/view/widgets/dummy_widget.dart';
import 'package:bike_ride_app/view/widgets/title_with_subtitle_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _reTypePasswordTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _agreeButton = false;

  @override
  void dispose() {
    _nameTEController.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _reTypePasswordTEController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        title: CustomText(text: 'Sign Up', fontSize: 18.sp),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.r),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // SizedBox(height: 71.h),
                    Assets.icons.authLogo.svg(height: 90.h, width: 110.w),
                    TitleWithSubTItleWidget(
                      title: "Join With Us!",
                      subTitle: 'Make sure your account keep secure',
                    ),
                    SizedBox(height: 40.h),
                    CustomTextField(
                      controller: _nameTEController,
                      filColor: AppColors.secondaryColor,
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      textInputAction: TextInputAction.next,
                      // prefixIcon: Assets.icons.nameFieldIcon.svg(),
                    ),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      controller: _emailTEController,
                      filColor: AppColors.secondaryColor,
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      isPassword: true,
                      isObscureText: true,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      controller: _passwordTEController,
                      filColor: AppColors.secondaryColor,
                      labelText: 'Confirm Password',
                      hintText: 'Enter your password',
                      textInputAction: TextInputAction.next,
                      isPassword: true,
                      isObscureText: true,
                      // prefixIcon: Assets.icons.passwordIcon.svg(),
                    ),
                    SizedBox(height: 60.h),
                    _checkBoxForTermsAndConditions(),
                    SizedBox(height: 60.h),
                    CustomButton(
                      onPressed: _onTapSignUpButton,
                      label: 'Sign Up',
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                    ),
                    SizedBox(height: 24.h),
                    RichText(
                      text: TextSpan(
                        text: "Already have an account?  ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          // color: Colors.white,
                          color: Color(0xFF6C6C6C),
                          fontFamily: FontFamily.inter,
                        ),
                        children: [
                          TextSpan(
                            text: "Sign In",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                              fontFamily: FontFamily.inter,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = _onTapSignInButton,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {
    Get.toNamed(AppRoutes.signInScreen);
  }

  Widget _checkBoxForTermsAndConditions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _agreeButton = !_agreeButton;
            });
          },
          child: _agreeButton
              ? Icon(Icons.check_box, color: AppColors.primaryColor)
              : Icon(
                  Icons.check_box_outline_blank_outlined,
                  color: AppColors.greyColor,
                ),
        ),
        SizedBox(width: 16.h),
        CustomText(
          text: 'I accept the',
          fontWeight: FontWeight.bold,
          fontSize: 12.sp,
          color: Colors.grey,
        ),
        SizedBox(width: 8.h),
        GestureDetector(
          onTap: () {
            // Get.toNamed(AppRoutes.termsOfServiceScreen);
          },
          child: CustomText(
            text: 'Terms & Condition',
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
            color: AppColors.secondaryColor,
            decoration: TextDecoration.underline,
          ),
        ),
        CustomText(
          text: ' & ',
          fontWeight: FontWeight.bold,
          fontSize: 12.sp,
          color: Colors.grey,
        ),

        GestureDetector(
          onTap: () {
            // Get.toNamed(AppRoutes.termsOfServiceScreen);
          },
          child: CustomText(
            text: 'Privacy Policy',
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
            color: AppColors.secondaryColor,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }

  void _onTapSignUpButton() {
    // if (_formKey.currentState!.validate()) {
    //   if (_agreeButton == true) {
    //     Get.offAllNamed(AppRoutes.bottomNavBarScreen);
    //   } else {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         content: Text('Please agree to the Terms & Condition to continue'),
    //         backgroundColor: Colors.red,
    //       ),
    //     );
    //   }

    //}
    Get.offAllNamed(AppRoutes.setUpProfileScreen);
  }
}
