import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/gen/fonts.gen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyAndTermsHelper extends StatelessWidget {
  const PrivacyAndTermsHelper(
      {super.key,});



  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: TextStyle(
                color: AppColors.secondaryColor, fontFamily: FontFamily.inter),
            text: 'By pressing “Continue” you will agree to Tassel',
            children: [
          TextSpan(
            style: TextStyle(
              color: Colors.black,
            ),
            text: ' Privacy Policy ',
            recognizer: TapGestureRecognizer()..onTap = (){
              // Get.toNamed(AppRoutes.privacyPolicyScreen);
            },
          ),
          TextSpan(text: 'and '),
          TextSpan(
            style: TextStyle(
              // color: AppColors.darkColor,
            ),
            text: 'Terms & Conditions.',
            recognizer: TapGestureRecognizer()..onTap = (){
              // Get.toNamed(AppRoutes.termsScreen);

            },
          ),
        ]));
  }
}
