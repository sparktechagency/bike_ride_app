import 'package:bike_ride_app/app/routes/app_routes.dart';
import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/gen/assets.gen.dart';
import 'package:bike_ride_app/gen/fonts.gen.dart';
import 'package:bike_ride_app/view/widgets/custom_button.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:bike_ride_app/view/widgets/custom_text_field.dart';
import 'package:bike_ride_app/view/widgets/dummy_widget.dart';
import 'package:bike_ride_app/view/widgets/title_with_subtitle_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: SizedBox.shrink(),
        title: CustomText(text: 'Sign In', fontSize: 18.sp),
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
                  Assets.icons.authLogo.svg(height: 90.h, width: 110.w),
                  TitleWithSubTItleWidget(
                    title: "Welcome Back!",
                    subTitle: 'Make sure that you already have an account.',
                  ),
                  SizedBox(height: 60.h),
                  CustomTextField(
                    controller: _emailTEController,
                    filColor: AppColors.secondaryColor,
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    isEmail: true,
                    // prefixIcon: Assets.icons.emailIcon.svg(),
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    controller: _passwordTEController,
                    filColor: AppColors.secondaryColor,
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    isPassword: true,
                    isObscureText: true,
                    // prefixIcon: Assets.icons.passwordIcon.svg(),
                  ),
                  // SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.forgetPasswordEmailScreen);
                        },
                        child: CustomText(text: 'Forgot Password',
                          color: Colors.black,
                          textAlign: TextAlign.end,),

                      ),
                    ],
                  ),
                  SizedBox(height: 148.h),
                  CustomButton(
                    onPressed: _onTapSignInButton,
                    label: 'Sign In',
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                  ),
                  SizedBox(height: 24.h),
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account?  ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // color: Colors.white,
                        color: Color(0xFF6C6C6C),
                        fontFamily: FontFamily.inter,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                              fontFamily: FontFamily.inter,
                              decoration: TextDecoration.underline
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = _onTapSignUpButton,
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
    );
  }

  void _onTapSignInButton() {
    if (_formKey.currentState!.validate()) {}
  }

  void _onTapSignUpButton() {
    Get.offNamed(AppRoutes.signUpScreen);
  }
}
