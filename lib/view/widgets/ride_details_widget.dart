import 'package:bike_ride_app/gen/assets.gen.dart';
import 'package:bike_ride_app/view/widgets/custom_container.dart';
import 'package:bike_ride_app/view/widgets/custom_network_image.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RideDetails extends StatefulWidget {
  const RideDetails({
    super.key,
    // required this.rideDetailsIcon,
    required this.rideTitle,
    required this.creatorImage,
    required this.creatorName,
    required this.button,
  });

  // final List<String> rideDetailsIcon;
  final List<String> rideTitle;
  final String creatorImage;
  final String creatorName;

  // final String buttonName;
  final Widget button;

  @override
  State<RideDetails> createState() => _RideDetailsState();
}

class _RideDetailsState extends State<RideDetails> {
  final List<String> rideDetailsIcon = [
    Assets.icons.ridesIcon.path,
    Assets.icons.groupIcon.path,
    Assets.icons.calenderIcon.path,
    Assets.icons.startIcon.path,
    Assets.icons.endIcon.path,
    Assets.icons.pitStopIcon.path,
  ];

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: 342.h,
      width: 300.w,
      linearColors: [Color(0xFF555555), Color(0xFF7D7D7D)],
      radiusAll: 8.r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: rideDetailsIcon.length,
              shrinkWrap: true,
              padding: EdgeInsets.all(16.r),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        rideDetailsIcon[index],
                        color: Colors.white,
                        height: 20.h,
                        width: 20.w,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: CustomText(
                          text: widget.rideTitle[index],
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.r, bottom: 16.h),
            child: Row(
              children: [
                CustomNetworkImage(
                  imageUrl: widget.creatorImage,
                  height: 26.h,
                  width: 26.w,
                  boxShape: BoxShape.circle,
                ),
                SizedBox(width: 8.w),
                CustomText(text: widget.creatorName, color: Colors.white),
              ],
            ),
          ),
          Center(
            child: widget.button,
            // child: CustomButton(
            //   label: "Start",
            //   onPressed: () {},
            //   height: 36.h,
            //   width: 214.w,
            // ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}