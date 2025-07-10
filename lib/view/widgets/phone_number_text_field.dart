import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/gen/fonts.gen.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({
    super.key,
    required this.numberTEController,
    this.title,
    this.borderColor,
    this.initialCountryCode

  });

  final TextEditingController numberTEController;
  final String? title;
  final Color? borderColor;
  final String? initialCountryCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null ? CustomText(
          text: title ?? '',
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
          color: AppColors.secondaryColor,
          fontName: FontFamily.montserrat,
        ) : SizedBox.shrink(),
        SizedBox(height: 8.h,),
        IntlPhoneField(
          controller: numberTEController,
          disableLengthCheck: true,
          decoration: InputDecoration(
            // labelText: 'Phone Number',
            border: OutlineInputBorder(
              borderSide: BorderSide(color:borderColor?? AppColors.primaryColor),
              borderRadius: BorderRadius.circular(10.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color:borderColor?? AppColors.primaryColor),
              borderRadius: BorderRadius.circular(10.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color:borderColor?? AppColors.primaryColor),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          initialCountryCode: 'IN',
          onChanged: (phone) {
            print(phone.completeNumber);
          },
        ),
      ],
    );
  }
}