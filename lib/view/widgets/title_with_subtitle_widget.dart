import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/gen/fonts.gen.dart';
import 'package:bike_ride_app/view/widgets/custom_button.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWithSubTItleWidget extends StatelessWidget {
  const TitleWithSubTItleWidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.titleColor,
    this.subTitleColor,
  });

  final String title;
  final String subTitle;
  final Color? titleColor;
  final Color? subTitleColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: 36.h),
        CustomText(
          text: title,
          fontSize: 24.sp,
          fontName: FontFamily.montserrat,
          color: titleColor ?? AppColors.primaryColor,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 8.h),
        CustomText(
          text: subTitle,
          color: subTitleColor ?? AppColors.grey400,
          fontName: FontFamily.inter,
        ),

      ],
    );
  }
}
