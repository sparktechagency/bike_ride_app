import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/gen/assets.gen.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Notifications',
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Assets.icons.notificationIcon.svg(),
            title: CustomText(
              text: 'Group Invitation',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.start,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text:
                      "Rakib has invited you to join the group Alpha Bikers. Tap to view and accept the invitation.",
                  fontSize: 12.sp,
                  textAlign: TextAlign.start,
                ),
                CustomText(
                  text: '16 Jun,2025',
                  fontSize: 10.sp,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
