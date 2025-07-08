import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/view/widgets/custom_container.dart';
import 'package:bike_ride_app/view/widgets/custom_network_image.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyGroupsScreen extends StatefulWidget {
  const MyGroupsScreen({super.key});

  @override
  State<MyGroupsScreen> createState() => _MyGroupsScreenState();
}

class _MyGroupsScreenState extends State<MyGroupsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'My Groups', fontSize: 18.sp),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 8.h),
            child: ListTile(
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
            ),
          );
        },
      ),
    );
  }
}
