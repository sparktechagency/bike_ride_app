import 'package:bike_ride_app/app/routes/app_routes.dart';
import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/view/widgets/custom_container.dart';
import 'package:bike_ride_app/view/widgets/custom_network_image.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:bike_ride_app/view/widgets/dummy_widget.dart';
import 'package:bike_ride_app/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({super.key});

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldWidget(hintText: 'Search group name', maxLine: 1),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        label: 'My Groups',
                        onPressed: () {
                          Get.toNamed(AppRoutes.myGroupScreen);
                        },
                        backgroundColor: AppColors.primaryColor,
                        fontSize: 16.sp,
                        height: 36.h,
                        width: 169.w,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: CustomButton(
                        label: 'Create Group',
                        onPressed: () {
                          Get.toNamed(AppRoutes.createGroupScreen);
                        },
                        prefix: Icon(
                          Icons.add,
                          color: AppColors.secondaryColor,
                          weight: 200,
                          size: 25.h,
                        ),
                        backgroundColor: AppColors.greyColor,
                        fontSize: 16.sp,
                        height: 36.h,
                        width: 169.w,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                CustomText(
                  text: 'Joined Group',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.secondaryColor,
                ),
                SizedBox(height: 8.h),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  // padding: EdgeInsets.only(bottom: 16.h),
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Get.toNamed(AppRoutes.groupMessageScreen);
                      },
                      contentPadding: EdgeInsets.only(
                        left: 0,
                        right: 0,
                        bottom: 16.h,
                      ),
                      leading: CustomNetworkImage(
                        imageUrl: "https://i.pravatar.cc/150?img=31",
                        height: 50.h,
                        width: 50.w,
                        boxShape: BoxShape.circle,
                      ),
                      title: CustomText(
                        text: 'Bikers Group',
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.start,
                      ),
                      subtitle: CustomText(
                        text: 'Going for a ride at 6am ',
                        textAlign: TextAlign.start,
                        color: Colors.grey,
                        fontSize: 12.sp,
                      ),
                      trailing: Column(
                        children: [
                          CustomText(text: '10:25', color: AppColors.grey400),
                          index == 0 || index == 1
                              ? CustomContainer(
                                  alignment: Alignment.center,
                                  height: 16.h,
                                  width: 16.w,
                                  color: AppColors.primaryColor,
                                  radiusAll: 2.r,
                                  child: CustomText(
                                    text: index == 0 ? '5' : "12",
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                  ),
                                )
                              : SizedBox.shrink(),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
