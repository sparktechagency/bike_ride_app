import 'package:bike_ride_app/app/routes/app_routes.dart';
import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/gen/assets.gen.dart';
import 'package:bike_ride_app/view/widgets/custom_container.dart';
import 'package:bike_ride_app/view/widgets/custom_network_image.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:bike_ride_app/view/widgets/dummy_widget.dart';
import 'package:bike_ride_app/view/widgets/list_tile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GroupDetailsScreen extends StatefulWidget {
  const GroupDetailsScreen({super.key});

  @override
  State<GroupDetailsScreen> createState() => _GroupDetailsScreenState();
}

class _GroupDetailsScreenState extends State<GroupDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Group's details",
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.r),
            child: Center(
              child: Column(
                spacing: 4,
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
                  SizedBox(height: 34.h),
                  ListTileWidget(
                    onTap: (){
                      Get.toNamed(AppRoutes.allMemberScreen);
                    },
                    leading: Assets.icons.membersIcon.svg(),
                    title: 'Member',
                  ),
                  SizedBox(height: 8.h),
                  ListTileWidget(
                    onTap: (){
                      Get.toNamed(AppRoutes.inviteMemberScreen);
                    },
                    leading: Assets.icons.inviteMemberIcon.svg(),
                    title: 'Invite Member',
                  ),
                  SizedBox(height: 8.h),
                  ListTileWidget(
                    leading: Assets.icons.mediaIcon.svg(),
                    title: 'Join Request',
                  ),
                  SizedBox(height: 8.h),
                  ListTileWidget(
                    onTap: (){
                      Get.toNamed(AppRoutes.mediaScreen);
                    },
                    leading: Assets.icons.mediaIcon.svg(),
                    title: 'Media and files',
                  ),
                  SizedBox(height: 130.h),
                  CustomButton(
                    label: 'Leave Group',
                    onPressed: () {},
                    fontColor: Colors.white,
                    fontWeight: FontWeight.w600,
                    borderRadius: 40.r,
                    backgroundColor: AppColors.errorColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

