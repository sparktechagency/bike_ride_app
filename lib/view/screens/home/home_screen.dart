import 'package:bike_ride_app/app/routes/app_routes.dart';
import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/gen/assets.gen.dart';
import 'package:bike_ride_app/view/widgets/custom_container.dart';
import 'package:bike_ride_app/view/widgets/custom_network_image.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:bike_ride_app/view/widgets/dummy_widget.dart';
import 'package:bike_ride_app/view/widgets/ride_details_widget.dart';
import 'package:bike_ride_app/view/widgets/show_buy_credits_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _amountTEController = TextEditingController();
  final List<String> rideTitle = [
    "Sunset Coastal Cruise",
    "Beachside Bikers",
    "Saturday, June 29, 2025 – 4:30 PM",
    "Marine Drive, Mumbai",
    "Alibaug Lighthouse",
    "Forest Point, Tea Junction",
  ];

  final List<String> rideDetailsIcon = [
    Assets.icons.ridesIcon.path,
    Assets.icons.groupIcon.path,
    Assets.icons.calenderIcon.path,
    Assets.icons.startIcon.path,
    Assets.icons.endIcon.path,
    Assets.icons.pitStopIcon.path,
  ];

  int? selectedRideSchedule; // Track which ride is selected (null means none)
  int? selectedNewRide; // Track which new ride is joined (null means none)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
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
                            color: AppColors.secondaryColor,
                          ),
                          label: 'Create New Ride',
                          onPressed: () {
                            Get.toNamed(AppRoutes.createRideScreen);
                          },
                          width: 314.w,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      CustomText(
                        text: "Today's Rides Schedule",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        height: 342.h,
                        child: ListView.builder(
                          itemCount: 2,
                          scrollDirection: Axis.horizontal,
                          itemExtent: 370.w,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final isSelected = selectedRideSchedule == index;
                            return Padding(
                              padding: EdgeInsets.only(right: 16.w),
                              child: RideDetails(
                                rideTitle: rideTitle,
                                creatorImage:
                                    "https://i.pravatar.cc/150?img=31",
                                creatorName: 'Megan Fox',
                                button: isSelected
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CustomButton(
                                            label: "Complete",
                                            onPressed: () {
                                              setState(() {
                                                selectedRideSchedule = null;
                                              });
                                            },
                                            height: 36.h,
                                            width: 150.w,
                                            backgroundColor:
                                                AppColors.greyColor,
                                          ),
                                          CustomButton(
                                            label: "Track",
                                            onPressed: () {
                                              Get.toNamed(
                                                AppRoutes.googleMapScreen,
                                              );
                                            },
                                            height: 36.h,
                                            width: 150.w,
                                          ),
                                        ],
                                      )
                                    : CustomButton(
                                        label: "Start",
                                        onPressed: () {
                                          setState(() {
                                            selectedRideSchedule = index;
                                          });
                                        },
                                        height: 36.h,
                                        width: 214.w,
                                      ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 16.h),
                      CustomText(
                        text: 'New Rides',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 8.h),
                      SizedBox(
                        height: 342.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemExtent: 370.w,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            final isSelected = selectedNewRide == index;
                            return Padding(
                              padding: EdgeInsets.only(right: 16.w),
                              child: RideDetails(
                                rideTitle: rideTitle,
                                creatorImage:
                                    "https://i.pravatar.cc/150?img=31",
                                creatorName: "Mark Robert",
                                button: CustomButton(
                                  label: isSelected ? 'Cancel' : 'Join',
                                  height: 36.h,
                                  width: 214.w,
                                  onPressed: () {
                                    setState(() {
                                      if (isSelected) {
                                        selectedNewRide = null;
                                      } else {
                                        selectedNewRide = index;
                                      }
                                    });
                                  },
                                  fontColor: isSelected ? Colors.white : null,
                                  backgroundColor: isSelected
                                      ? AppColors.errorColor
                                      : null,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCreditCard() {
    return SizedBox(
      width: 310.w,
      height: 150.h,
      child: Stack(
        children: [
          Assets.images.creditsCard.svg(width: 310.w, height: 150.h),
          Positioned(
            right: 10.w,
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
                    children: [
                      Assets.icons.coinIcon.svg(height: 24.h, width: 24.w),
                      SizedBox(width: 8.w),
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
            bottom: 10.h,
            left: 0,
            right: 0,
            child: Column(
              children: [
                CustomButton(
                  label: "Buy More Credits",
                  onPressed: () {
                    showBuyCreditsDialog(
                      context: context,
                      amountTEController: _amountTEController,
                    );
                  },
                  height: 36.h,
                  width: 214.w,
                  fontSize: 16.sp,
                ),
                SizedBox(height: 4.h),
                CustomText(
                  text: 'Each ride costs 1 credits. 1 credit = \$1.',
                  fontSize: 12.sp,
                  color: Color(0xFF004A54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.profileScreen);
        },
        child: Row(
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
            SizedBox(width: 16.w),
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
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.notificationsScreen);
          },
          child: Stack(
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
        ),
        SizedBox(width: 16.w),
      ],
    );
  }
}
