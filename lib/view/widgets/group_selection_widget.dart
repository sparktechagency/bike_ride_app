import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/view/widgets/custom_container.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupSelection extends StatelessWidget {
  const GroupSelection({
    super.key,
    this.onTap,
    required this.groupType,
    required this.isTapped,
  });

  final Function()? onTap;
  final String groupType;
  final bool isTapped;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomContainer(
                height: 21.h,
                width: 21.w,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isTapped
                      ? AppColors.primaryColor
                      : AppColors.greyColor,
                ),
              ),
              isTapped
                  ? CustomContainer(
                height: 10.h,
                width: 10.w,
                shape: BoxShape.circle,
                color: AppColors.primaryColor,
                // border: Border.all(color: AppColors.primaryColor),
              )
                  : SizedBox.shrink(),
            ],
          ),
        ),
        SizedBox(width: 8.w),
        CustomText(text: groupType),
      ],
    );
  }
}