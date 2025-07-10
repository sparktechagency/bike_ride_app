import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/gen/assets.gen.dart';
import 'package:bike_ride_app/view/widgets/custom_container.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Support",
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            Assets.images.supportImage.image(),
            SizedBox(height: 16.h),
            CustomText(
              text:
                  "If you face any kind of problem with our service feel free to contact us.",
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
            SizedBox(height: 48.h),
            _buildSupport(
              'Bikerbros100 @gmail.com',
              Assets.icons.supportEmailIcon.svg(height: 40.h, width: 40.w),
            ),
            SizedBox(height: 24.h,),
            _buildSupport(
              '+8801 2335435456547657',
              Assets.icons.supportPhoneIcon.svg(height: 40.h, width: 40.w),
            ),
          ],
        ),
      ),
    );
  }

  Stack _buildSupport(String text, Widget icon) {
    return Stack(
      alignment: Alignment(-1.06, 0),
      children: [
        CustomContainer(
          alignment: Alignment.center,
          height: 46.h,
          width: 276.w,
          bordersColor: AppColors.primaryColor,
          radiusAll: 100.r,
          child: CustomText(text: text, fontSize: 16.sp),
        ),
        icon,
      ],
    );
  }
}
