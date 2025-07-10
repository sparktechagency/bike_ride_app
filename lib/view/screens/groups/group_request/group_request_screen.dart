import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/view/widgets/custom_network_image.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:bike_ride_app/view/widgets/dummy_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupRequestScreen extends StatefulWidget {
  const GroupRequestScreen({super.key});

  @override
  State<GroupRequestScreen> createState() => _GroupRequestScreenState();
}

// Group Invitation
class _GroupRequestScreenState extends State<GroupRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Group Invitation",
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.r),
        child: Center(
          child: Column(
            children: [
              CustomNetworkImage(
                border: Border.all(color: AppColors.primaryColor, width: 2),
                imageUrl: "https://i.pravatar.cc/150?img=68",
                height: 129.h,
                width: 129.w,
                boxShape: BoxShape.circle,
              ),
              SizedBox(height: 8.h),
              CustomText(
                text: 'Kingdom Youth',
                color: AppColors.primaryColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
              CustomText(text: 'Biker Group'),
              CustomText(
                text: '150 Members',
                color: AppColors.grey400,
                fontSize: 12.sp,
              ),
              SizedBox(height: 53.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    label: "Decline",
                    fontSize: 16.sp,
                    onPressed: () {},
                    height: 36.h,
                    width: 150.w,
                    borderRadius: 16.r,
                    backgroundColor: AppColors.grey50,
                  ),
                  SizedBox(width: 8.w),
                  CustomButton(
                    label: "Accept",
                    fontSize: 16.sp,
                    onPressed: () {},
                    borderRadius: 16.r,
                    height: 36.h,
                    width: 150.w,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
