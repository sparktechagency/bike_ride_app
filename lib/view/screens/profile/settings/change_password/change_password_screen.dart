import 'package:bike_ride_app/gen/assets.gen.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:bike_ride_app/view/widgets/custom_text_field.dart';
import 'package:bike_ride_app/view/widgets/dummy_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _currentPassTEController =
      TextEditingController();
  final TextEditingController _newPassTEController = TextEditingController();
  final TextEditingController _reTypePassTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Change Password",
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            children: [
              Assets.images.changePasswordScreen.image(),
              SizedBox(height: 28.h),
              CustomTextField(
                controller: _currentPassTEController,
                hintText: 'Enter a new password',
                labelText: 'Current Password',
                isPassword: true,
                isObscureText: true,
              ),
              SizedBox(height: 18.h),
              CustomTextField(
                controller: _currentPassTEController,
                hintText: 'Enter a new password',
                labelText: 'New Password',
                isPassword: true,
                isObscureText: true,
              ),
              SizedBox(height: 18.h),
              CustomTextField(
                controller: _currentPassTEController,
                hintText: 'Enter a new password',
                labelText: 'Confirm Password',
                isPassword: true,
                isObscureText: true,
              ),
              SizedBox(height: 120.h),
              CustomButton(label: "Update", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
