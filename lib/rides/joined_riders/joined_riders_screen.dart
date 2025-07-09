import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/view/widgets/custom_network_image.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JoinedRidersScreen extends StatefulWidget {
  const JoinedRidersScreen({super.key});

  @override
  State<JoinedRidersScreen> createState() => _JoinedRidersScreenState();
}

class _JoinedRidersScreenState extends State<JoinedRidersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Joined Riders",
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.r),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomText(
                      text: 'Total Riders:',
                      fontSize: 20.sp,
                      color: AppColors.grey400,
                    ),
                    CustomText(
                      text: '12',
                      fontSize: 20.sp,
                      color: AppColors.secondaryColor,
                    ),
                  ],
                ),
                ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.only(
                        left: 0,
                        right: 0,
                        bottom: 12,
                      ),
                      leading: CustomNetworkImage(
                        imageUrl:
                        "https://i.pravatar.cc/150?img=${index + 1}",
                        height: 45.h,
                        width: 45.w,
                        boxShape: BoxShape.circle,
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      title: Row(
                        spacing: 4,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Alex James',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          index == 0
                              ? CustomText(
                            text: '(Ride Creator)',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          )
                              : SizedBox.shrink(),
                        ],
                      ),
                      subtitle: CustomText(
                        text: 'a2bc23@gmail.com',
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: AppColors.greyColor,
                        textAlign: TextAlign.start,
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
