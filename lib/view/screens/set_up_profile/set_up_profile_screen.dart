import 'dart:io';

import 'package:bike_ride_app/app/helpers/image_picker_helper.dart';
import 'package:bike_ride_app/app/routes/app_routes.dart';
import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/view/widgets/custom_bottom_sheet.dart';
import 'package:bike_ride_app/view/widgets/custom_container.dart';
import 'package:bike_ride_app/view/widgets/custom_network_image.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:bike_ride_app/view/widgets/custom_text_field.dart';
import 'package:bike_ride_app/view/widgets/dummy_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SetUpProfileScreen extends StatefulWidget {
  const SetUpProfileScreen({super.key});

  @override
  State<SetUpProfileScreen> createState() => _SetUpProfileScreenState();
}

class _SetUpProfileScreenState extends State<SetUpProfileScreen> {
  final ImagePickerHelper _imagePickerHelper = ImagePickerHelper();
  File? _profileImage;
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _numberTEController = TextEditingController();
  final TextEditingController _emergencyNumberTEController =
      TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

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
        leading: SizedBox.shrink(),
        title: CustomText(text: 'Setup Profile', fontSize: 18.sp),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.r),
        child: Center(
          child: Form(
            key: _globalKey,
            child: Column(
              children: [
                _addProfileImage(),
                SizedBox(height: 16.h),
                CustomText(text: 'Upload profile picture', fontSize: 16.sp),
                SizedBox(height: 40.h),

                CustomTextField(
                  controller: _nameTEController,
                  hintText: 'Enter your Name',
                  labelText: 'Full Name',
                ),
                SizedBox(height: 16.h),

                CustomTextField(
                  controller: _nameTEController,
                  hintText: 'Enter your Name',
                  labelText: 'Mobile Number',
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _nameTEController,
                  hintText: 'Mobile Number',
                  labelText: 'Emergency Contact Number',
                ),
                SizedBox(height: 150.h),
                CustomButton(
                  label: 'Save & Continue',
                  onPressed: _onTapSignUpButton,
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
              // ? CustomNetworkImage(
              //     imageUrl: "https://i.pravatar.cc/150?img=31",
              //     height: 120.h,
              //     width: 120.w,
              //     borderRadius: BorderRadius.circular(1000.r),
              //   )
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

  void _onTapSignUpButton() {
    // if (_formKey.currentState!.validate()) {
    //   if (_agreeButton == true) {
    //     Get.offAllNamed(AppRoutes.bottomNavBarScreen);
    //   } else {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         content: Text('Please agree to the Terms & Condition to continue'),
    //         backgroundColor: Colors.red,
    //       ),
    //     );
    //   }

    //}
    Get.offAllNamed(AppRoutes.bottomNavBarScreen);
  }
}
