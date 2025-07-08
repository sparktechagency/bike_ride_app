import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    this.isPrefixShowing = true,
    this.suffixIcon,
    this.maxLine,
    this.controller,
    this.textInputAction,
    this.hintFontSize,
    this.keyboardType,
    this.filledColor,
    this.borderColor
  });

  final String hintText;
  final bool isPrefixShowing;
  final Widget? suffixIcon;
  final int? maxLine;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final double? hintFontSize;
  final TextInputType? keyboardType;
  final Color? filledColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: textInputAction,
      cursorColor: AppColors.primaryColor,
      keyboardType: keyboardType,
      minLines: 1,
      maxLines: maxLine,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16.sp,
        decoration: TextDecoration.none,
      ),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: isPrefixShowing
            ? Icon(Icons.search, color: AppColors.borderColor)
            : null,

        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.greyColor,
          fontSize: hintFontSize,
        ),
        filled: true,
        fillColor: filledColor??AppColors.filledColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(36.r),
          borderSide: BorderSide(color:borderColor?? AppColors.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(36.r),
          borderSide: BorderSide(color:borderColor?? AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(36.r),
          borderSide: BorderSide(color:borderColor?? AppColors.borderColor),
        ),
      ),
    );
  }
}
