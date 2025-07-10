import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/gen/fonts.gen.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:bike_ride_app/view/widgets/dummy_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<bool?> customPopUpWidget({
  required BuildContext context,
  required String title,
  required String subtitle,
  Color? titleColor,
  String? firstButton,
  String? lastButton,
  Color? latButtonBgColor,
  void Function()? onPressedFirstButton,
  void Function()? onPressedLastButton,
}) async {
  return showDialog(
    context: context,
    // barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        alignment: Alignment.center,
        backgroundColor: AppColors.bgColor,

        title: CustomText(
          text: title,
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
          fontName: FontFamily.inter,
          textAlign: TextAlign.start,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: subtitle,
              fontSize: 16.sp,
              textAlign: TextAlign.start,
              color: AppColors.grey400,
            ),
            SizedBox(height: 30.h,),
            Row(
              spacing: 4,
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      onPressedFirstButton;
                      Get.back();
                    },
                    label: firstButton??"",
                    fontColor: Colors.white,
                    fontWeight: FontWeight.w500,
                    height: 36.h,
                    width: 130.w,
                    // radius: 8.r,
                    backgroundColor: AppColors.grey200,
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      onPressedLastButton;
                      Get.back();
                    },
                    label: lastButton??'',
                    fontColor: Colors.white,
                    fontWeight: FontWeight.w500,
                    height: 36.h,
                    width: 130.w,
                    backgroundColor:latButtonBgColor??AppColors.errorColor,
                    // radius: 8.r,
                  ),
                ),
              ],
            )
          ],
        ),
        // actions: [
        //
        // ],
      );
    },
  );
}
