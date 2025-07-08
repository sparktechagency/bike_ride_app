import 'package:bike_ride_app/view/widgets/custom_network_image.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MediaScreen extends StatefulWidget {
  const MediaScreen({super.key});

  @override
  State<MediaScreen> createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Invite Members",
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: GridView.builder(
        itemCount: 30,
        padding: EdgeInsets.all(16.r),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8
        ),
        itemBuilder: (context, index) {
          return CustomNetworkImage(
            imageUrl: "https://i.pravatar.cc/150?img=${index + 1}",
            height: 100.h,
            width: 100.w,
            borderRadius: BorderRadius.circular(8.r),
          );
        },
      ),
    );
  }
}
