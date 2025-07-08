import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final double? fontSize;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final Widget? prefix;
  final Color? backgroundColor;
  final double? borderRadius;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.height,
    this.width,
    this.fontSize,
    this.fontColor,
    this.fontWeight,
    this.prefix,
    this.backgroundColor,
    this.borderRadius
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Outer base
        Container(
          height: height ?? 50.h,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.primaryColor,
            borderRadius: BorderRadius.circular(borderRadius??12),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.3),
            //     offset: const Offset(2, 4),
            //     blurRadius: 6,
            //   ),
            // ],
          ),
        ),

        // Top inner shadow layer
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius??12),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black.withOpacity(0.2), Colors.transparent],
              ),
            ),
          ),
        ),

        // Button content
        Positioned.fill(
          child: TextButton(
            style: TextButton.styleFrom(
              // alignment: Alignment.center,
              padding: EdgeInsets.all(0),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius??12),
              ),
            ),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (prefix != null) ...[?prefix, SizedBox(width: 8.w)],
                CustomText(
                  text: label,
                  fontSize: fontSize ?? 20.sp,
                  color: fontColor ?? AppColors.secondaryColor,
                  fontWeight: fontWeight ?? FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
