import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/view/widgets/custom_container.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    this.leading,
    this.title,
    this.suffix,
    this.leadingColor,
    this.titleColor,
    this.bgColor,
    this.onTap,
    this.subtitle,
    this.subtitleColor,
    this.subTitleSize,
    this.titleWeight,
    this.titleSize,
  });

  final Widget? leading;
  final String? title;
  final Widget? suffix;
  final Color? leadingColor;
  final Color? titleColor;
  final Color? bgColor;
  final Function()? onTap;
  final String? subtitle;
  final Color? subtitleColor;
  final double? subTitleSize;
  final FontWeight? titleWeight;
  final double? titleSize;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      onTap: onTap,
      height: 56.h,
      width: 345.w,
      color: bgColor ?? AppColors.navBarFieldColor,
      radiusAll: 8.r,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // Assets.icons.membersIcon.svg(),
                leading!,
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: title!,
                      color: titleColor,
                      textAlign: TextAlign.start,
                      fontSize: titleSize,
                      fontWeight: titleWeight ?? FontWeight.w400,
                    ),
                    subtitle != null
                        ? CustomText(
                            text: subtitle ?? '',
                            color: subtitleColor,
                            fontSize: subTitleSize ?? 12.sp,
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ],
            ),
            suffix ?? Icon(Icons.arrow_right, size: 30.h, color: titleColor),
          ],
        ),
      ),
    );
  }
}
