import 'package:bike_ride_app/app/routes/app_routes.dart';
import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/view/widgets/completed_ride.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:bike_ride_app/view/widgets/dummy_widget.dart';
import 'package:bike_ride_app/view/widgets/ride_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RidesScreen extends StatefulWidget {
  const RidesScreen({super.key});

  @override
  State<RidesScreen> createState() => _RidesScreenState();
}

class _RidesScreenState extends State<RidesScreen> {
  int _selectedIndex = 0;
  int? selectedNewRide = 0;
  int? selectedRideSchedule;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Rides",
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      label: "All Ride",
                      fontSize: 16.sp,
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                      },
                      height: 36.h,
                      width: 169.w,
                      borderRadius: 8.r,
                      backgroundColor: _selectedIndex == 0
                          ? null
                          : AppColors.greyColor,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: CustomButton(
                      label: 'My Created Rides',
                      fontSize: 16.sp,
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                      height: 36.h,
                      width: 169.w,
                      borderRadius: 8.r,
                      backgroundColor: _selectedIndex == 1
                          ? null
                          : AppColors.greyColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              _selectedIndex == 0 ? _allRides() : _completedRide(),
            ],
          ),
        ),
      ),
      floatingActionButton: CustomButton(
        label: 'Create New Ride',
        prefix: Icon(Icons.add, color: AppColors.secondaryColor, size: 25.h),
        backgroundColor: AppColors.grey50,
        height: 44.h,
        width: 160.w,
        fontSize: 14.sp,
        onPressed: () {
          Get.toNamed(AppRoutes.createRideScreen);
        },
      ),
    );
  }

  ListView _completedRide() {
    return ListView.builder(
      itemCount: 2,
      // scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      // itemExtent: 370.w,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final isSelected = selectedRideSchedule == index;
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: RideDetails(
            width: double.infinity,
            rideTitle: [
              "Sunset Coastal Cruise",
              "Beachside Bikers",
              "Saturday, June 29, 2025 – 4:30 PM",
              "Marine Drive, Mumbai",
              "Alibaug Lighthouse",
              "Forest Point, Tea Junction",
            ],
            creatorImage: "https://i.pravatar.cc/150?img=31",
            creatorName: 'Megan Fox',
            button: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  label: "Cancel",
                  fontSize: 16.sp,
                  onPressed: () {
                    setState(() {
                      selectedRideSchedule = null;
                    });
                  },
                  height: 36.h,
                  width: 150.w,
                  backgroundColor: AppColors.errorColor,
                  fontColor: Colors.white,
                ),
                CustomButton(
                  label: "Joined Rider List",
                  fontSize: 16.sp,
                  onPressed: () {
                    Get.toNamed(AppRoutes.joinedRideScreen);
                  },
                  height: 36.h,
                  width: 150.w,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ListView _allRides() {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      // padding: EdgeInsets.only(bottom: 16.h),
      itemBuilder: (context, index) {
        final isSelected = selectedNewRide == index;
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: RideDetails(
            width: double.infinity,
            rideTitle: [
              "Sunset Coastal Cruise",
              "Beachside Bikers",
              "Saturday, June 29, 2025 – 4:30 PM",
              "Marine Drive, Mumbai",
              "Alibaug Lighthouse",
              "Forest Point, Tea Junction",
            ],
            creatorImage: "https://i.pravatar.cc/150?img=21",
            creatorName: "Mark phil",
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
              backgroundColor: isSelected ? AppColors.errorColor : null,
            ),
          ),
        );
      },
    );
  }
}
