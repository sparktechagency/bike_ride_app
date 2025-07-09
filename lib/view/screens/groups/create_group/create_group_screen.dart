import 'dart:io';

import 'package:bike_ride_app/app/helpers/image_picker_helper.dart';
import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/view/widgets/custom_bottom_sheet.dart';
import 'package:bike_ride_app/view/widgets/custom_container.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:bike_ride_app/view/widgets/custom_text_field.dart';
import 'package:bike_ride_app/view/widgets/dummy_widget.dart';
import 'package:bike_ride_app/view/widgets/group_selection_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
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

  int _selectedIndex = 0;

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
            child: Form(
              key: _globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        _groupImage == null
                            ? CustomContainer(
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
                        SizedBox(height: 16.h),
                        CustomText(text: 'Upload Photo'),
                      ],
                    ),
                  ),

                  SizedBox(height: 40.h),
                  CustomTextField(
                    controller: _controller,
                    hintText: 'Create a group name',
                    labelText: 'Group Name',
                  ),
                  SizedBox(height: 18.h),
                  CustomText(
                    text: 'Group Type',
                    color: AppColors.secondaryColor,
                    textAlign: TextAlign.start,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: Column(
                      children: [
                        SizedBox(height: 4.h),
                        GroupSelection(
                          onTap: () {
                            setState(() {
                              _selectedIndex = 0;
                            });
                          },
                          isTapped: _selectedIndex == 0,
                          groupType: 'Biker Group',
                        ),
                        SizedBox(height: 8.h),
                        GroupSelection(
                          onTap: () {
                            setState(() {
                              _selectedIndex = 1;
                            });
                          },
                          isTapped: _selectedIndex == 1,
                          groupType: 'Cycling Group',
                        ),
                        SizedBox(height: 8.h),
                        GroupSelection(
                          onTap: () {
                            setState(() {
                              _selectedIndex = 2;
                            });
                          },
                          isTapped: _selectedIndex == 2,
                          groupType: 'Car Group',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 100.h),
                  CustomButton(label: 'Update', onPressed:_onTapUpdateButton),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapUpdateButton() {
    if(_globalKey.currentState!.validate()){

    }
  }
}
