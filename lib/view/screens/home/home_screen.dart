import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/gen/assets.gen.dart';
import 'package:bike_ride_app/view/widgets/custom_container.dart';
import 'package:bike_ride_app/view/widgets/custom_network_image.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:bike_ride_app/view/widgets/dummy_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Your Credits',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 8.h),
                Center(child: _buildCreditCard()),
                SizedBox(height: 16.h),
                Center(
                  child: CustomButton(
                    prefix: Icon(
                      Icons.add,
                      size: 30.h,
                      weight: 400,
                      color: AppColors.secondaryColor,
                    ),
                    label: 'Create New Ride',
                    onPressed: () {},
                    width: 314.w,
                  ),
                ),
                SizedBox(height: 24.h,),
                CustomText(text: "Today's Rides Schedule",fontSize: 16.sp,fontWeight: FontWeight.w500,),
                SizedBox(height: 24.h,),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCreditCard() {
    return Stack(
      children: [
        Assets.images.creditsCard.svg(height: 150.h, width: 310.w),
        Positioned(
          right: 10,
          child: Padding(
            padding: EdgeInsets.all(12.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text: 'Available Credit',
                  color: AppColors.primaryColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Assets.icons.coinIcon.svg(),
                    CustomText(
                      text: '40',
                      fontSize: 32.sp,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Column(
            spacing: 2,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButton(
                label: "Buy More Credits",
                onPressed: () {},
                height: 36.h,
                width: 214.w,
                fontSize: 16.sp,
              ),
              CustomText(
                text: 'Each ride costs 1 credits. 1 credit = \$1.',
                fontSize: 12.sp,
                color: Color(0xFF004A54),
              ),
            ],
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        spacing: 16,
        children: [
          CustomContainer(
            alignment: Alignment.center,
            height: 52.h,
            width: 52.w,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.secondaryColor, width: 3),
            child: CustomNetworkImage(
              imageUrl: "https://i.pravatar.cc/150?img=31",
              borderRadius: BorderRadius.circular(1000.r),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'De Suarz !',
                fontSize: 20.sp,
                color: AppColors.secondaryColor,
              ),
              CustomText(text: '+1398403280820', color: AppColors.grey400),
            ],
          ),
        ],
      ),
      actions: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Icon(
              Icons.notifications,
              size: 30.h,
              color: AppColors.secondaryColor,
            ),
            CustomContainer(
              height: 8.h,
              width: 8.w,
              shape: BoxShape.circle,
              color: AppColors.errorColor,
            ),
          ],
        ),
        SizedBox(width: 16.w),
      ],
    );
  }
}
