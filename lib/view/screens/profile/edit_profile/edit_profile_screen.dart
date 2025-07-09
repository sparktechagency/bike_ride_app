import 'dart:io';

import 'package:bike_ride_app/app/helpers/image_picker_helper.dart';
import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/view/widgets/custom_bottom_sheet.dart';
import 'package:bike_ride_app/view/widgets/custom_container.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:bike_ride_app/view/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _numberTEController = TextEditingController();
  final TextEditingController _emergencyNumberTEController =
      TextEditingController();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Center(
            child: Column(
              children: [
                _addProfileImage(),
                CustomTextField(
                  controller: _nameTEController,
                  hintText: 'Rakibul Hasan Khan',
                  labelText: 'Full Name',
                ),
                CustomTextField(
                  controller: _nameTEController,
                  hintText: '2452345643',
                  labelText: 'Mobile Number',
                ),
                CustomTextField(
                  controller: _nameTEController,
                  hintText: '4523453453',
                  labelText: 'Emergency Contact Number',
                ),
              ],
            ),
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
              ? CustomContainer(
                  // alignment: Alignment.bottomCenter,
                  height: 88.h,
                  width: 88.w,
                  shape: BoxShape.circle,
                  color: Color(0xFFCDCED2),
                  child: Icon(Icons.person, color: Colors.white, size: 100.h),
                )
              //     ? CustomNetworkImage(
              //   imageUrl: "https://i.pravatar.cc/150?img=33",
              //   height: 120.h,
              //   width: 120.w,
              //   borderRadius: BorderRadius.circular(1000.r),
              // )
              : ClipOval(child: Image.file(_profileImage!, fit: BoxFit.cover)),
        ),
        GestureDetector(
          onTap: () {
            customBottomSheet(
              context: context,
              buttons: ['Gallery', 'Camera'],
              onPressedCallbacks: [
                () {
                  _getPhotoFromGallery();
                },
                () {
                  _getPhotoFromCamera();
                },
              ],
            );
          },
          child: CustomContainer(
            alignment: Alignment.center,
            height: 30.h,
            width: 30.w,
            color: AppColors.primaryColor,
            radiusAll: 8.r,
            shape: BoxShape.circle,
            child: Icon(
              CupertinoIcons.photo_camera_solid,
              color: Colors.white,
              size: 14.h,
            ),
          ),
        ),
      ],
    );
  }
}
