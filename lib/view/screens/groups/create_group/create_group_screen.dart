import 'dart:io';

import 'package:bike_ride_app/app/helpers/image_picker_helper.dart';
import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/view/widgets/custom_bottom_sheet.dart';
import 'package:bike_ride_app/view/widgets/custom_container.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  final ImagePickerHelper _imagePicker = ImagePickerHelper();
  File? _groupImage;

  Future<void> _takePhotoFromCamera() async {
    final image = await _imagePicker.pickFromCamera();
    if (image != null) {
      setState(() {
        _groupImage = image;
      });
    }
  }

  Future<void> _takePhotoFromGallery() async {
    final image = await _imagePicker.pickFromGallery();
    if (image != null) {
      setState(() {
        _groupImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Create Group",
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.r),
            child: Center(
              child: Column(
                children: [
                  _groupImage == null
                      ? GestureDetector(
                          onTap: () {
                            customBottomSheet(
                              context: context,
                              buttons: ['Gallery', 'Camera'],
                              onPressedCallbacks: [
                                () {
                                  _takePhotoFromGallery();
                                },
                                () {
                                  _takePhotoFromCamera();
                                },
                              ],
                            );
                          },
                          child: CustomContainer(
                            alignment: Alignment.center,
                            height: 118.h,
                            width: 118.w,
                            shape: BoxShape.circle,
                            color: Color(0xFFD9D9D9),
                            child: Icon(
                              Icons.add,
                              color: AppColors.primaryColor,
                              size: 80.h,
                            ),
                          ),
                        )
                      // ? CustomNetworkImage(
                      //     imageUrl: "https://i.pravatar.cc/150?img=31",
                      //     height: 120.h,
                      //     width: 120.w,
                      //     borderRadius: BorderRadius.circular(1000.r),
                      //   )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(1000.r),
                          child: Image.file(
                            _groupImage!,
                            fit: BoxFit.cover,
                            height: 118.h,
                            width: 118.w,
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
