import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/view/widgets/custom_container.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:bike_ride_app/view/widgets/custom_text_field.dart';
import 'package:bike_ride_app/view/widgets/dummy_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<dynamic> showBuyCreditsDialog({
  required BuildContext context,
  required TextEditingController amountTEController,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: CustomContainer(
          height: 251.h,
          width: 335.w,
          color: Colors.white,
          radiusAll: 8.r,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: CustomTextField(
                      controller: amountTEController,
                      borderRadio: 8.r,
                      filColor: AppColors.grey50,
                      filled: true,
                      labelText: 'Credit Needs',
                      hintText: 'Enter your amount',
                    ),
                  ),
                  SizedBox(height: 8.h),
                  CustomText(
                    text: 'Each ride costs 1 credits. 1 credit = \$1.',
                    fontSize: 12.sp,
                    color: AppColors.secondaryColor,
                  ),
                  SizedBox(height: 11.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Total to pay ',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: AppColors.secondaryColor,
                      ),
                      CustomText(text: '\$200'),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  CustomButton(
                    label: 'Buy Now',
                    onPressed: () {},
                    height: 36.h,
                    width: 214.w,
                  ),
                ],
              ),
              Positioned(
                right: 10,
                top: 0,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                    amountTEController.clear();
                  },
                  icon: Icon(Icons.close, color: AppColors.errorColor),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
      );
    },
  );
}
