import 'dart:io';

import 'package:bike_ride_app/app/helpers/image_picker_helper.dart';
import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/gen/assets.gen.dart';
import 'package:bike_ride_app/view/widgets/custom_bottom_sheet.dart';
import 'package:bike_ride_app/view/widgets/custom_container.dart';
import 'package:bike_ride_app/view/widgets/custom_network_image.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:bike_ride_app/view/widgets/list_tile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePickerHelper _imagePickerHelper = ImagePickerHelper();
  File? _profileImage;

  Future<void> _getPhotoFromGallery() async {
    final image = await _imagePickerHelper.pickFromGallery();
    if (image != null) {
      setState(() {
        _profileImage = image;
      });
    }
  }

  Future<void> _getPhotoFromCamera() async {
    final image = await _imagePickerHelper.pickFromCamera();
    if (image != null) {
      setState(() {
        _profileImage = image;
      });
    }
  }

  final List<Map<String, dynamic>> profileItems = [
    {'icon': Assets.icons.editProfileIcon.path, 'name': "Edit Profile"},
    {'icon': Assets.icons.myWalletIcon.path, 'name': "My Wallet"},
    {'icon': Assets.icons.settingsIcon.path, 'name': "Settings"},
    {'icon': Assets.icons.supportIcon.path, 'name': "Support"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Profile",
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.r),
        child: Center(
          child: Column(
            children: [
              _addProfileImage(),
              SizedBox(height: 24.h),
              CustomText(
                text: 'Jupshy Jasmin',
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
              ),
              SizedBox(height: 8.h),
              CustomText(
                text: 'nehadkhan2021@gmail.com',
                color: AppColors.greyColor,
              ),
              SizedBox(height: 42.h),
              Column(
                children: List.generate(profileItems.length, (index) {
                  final items = profileItems[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: ListTileWidget(
                      onTap: () {},
                      leading: SvgPicture.asset(items['icon']),
                      title: items['name'],
                      titleColor: Colors.white,
                      bgColor: AppColors.grey400,
                    ),
                  );
                }),
              ),
              SizedBox(height:100.h,),

            ],
          ),
        ),
      ),
    );
  }

  Widget _addProfileImage() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CustomContainer(
          height: 120.h,
          width: 120.w,
          shape: BoxShape.circle,
          child: _profileImage == null
              // ? CustomContainer(
              //     // alignment: Alignment.bottomCenter,
              //     height: 88.h,
              //     width: 88.w,
              //     shape: BoxShape.circle,
              //     color: Color(0xFFCDCED2),
              //     child: Icon(Icons.person, color: Colors.white, size: 100.h),
              //   )
              ? CustomNetworkImage(
                  imageUrl: "https://i.pravatar.cc/150?img=33",
                  height: 120.h,
                  width: 120.w,
                  borderRadius: BorderRadius.circular(1000.r),
                )
              : ClipOval(child: Image.file(_profileImage!, fit: BoxFit.cover)),
        ),
        // GestureDetector(
        //   onTap: () {
        //     customBottomSheet(
        //       context: context,
        //       buttons: ['Gallery', 'Camera'],
        //       onPressedCallbacks: [
        //         () {
        //           _getPhotoFromGallery();
        //         },
        //         () {
        //           _getPhotoFromCamera();
        //         },
        //       ],
        //     );
        //   },
        //   child: CustomContainer(
        //     alignment: Alignment.center,
        //     height: 30.h,
        //     width: 30.w,
        //     color: AppColors.primaryColor,
        //     radiusAll: 8.r,
        //     shape: BoxShape.circle,
        //     child: Icon(
        //       CupertinoIcons.photo_camera_solid,
        //       color: Colors.white,
        //       size: 14.h,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
