import 'package:bike_ride_app/app/helpers/toast_message_helper.dart';
import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/gen/fonts.gen.dart';
import 'package:bike_ride_app/view/widgets/custom_container.dart';
import 'package:bike_ride_app/view/widgets/custom_global_app_bar.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class BottomSheetHelper {
  static final ImagePicker _picker = ImagePicker();

  static void showImageOrVideoSheet(
    BuildContext context, {
    bool isVideo = false,
    required Function(File) onFilePicked,
  }) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () async {
              if (isVideo) {
                await _pickVideo(onFilePicked, source: ImageSource.gallery);
              } else {
                await _pickImage(onFilePicked, source: ImageSource.gallery);
              }
              Navigator.pop(context);
            },
            child: Text(
              'Choose from Camera Roll',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              if (isVideo) {
                await _pickVideo(onFilePicked, source: ImageSource.camera);
              } else {
                await _pickImage(onFilePicked, source: ImageSource.camera);
              }
              Navigator.pop(context);
            },
            child: Text('Take photo', style: TextStyle(color: Colors.blue)),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  static void moreDetailsBottomSheet(
    BuildContext context,
    onDone, [
    List<String>? maritalStatuses,
  ]) {
    final BottomSheetController controller = Get.put(BottomSheetController());

    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: AppColors.bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  width: 32.w,
                  child: Divider(
                    color: AppColors.secondaryColor,
                    thickness: 4.h,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              CustomGlobalAppBar(
                title: 'More details',
                actions: [
                  CustomText(
                    onTap: () {
                      if (controller.selectedTopics.length > 5) {
                        ToastMessageHelper.showToastMessage(
                          'You can select up to 5 topics only',
                          actionColor: Colors.red,
                        );
                        return;
                      }
                      Navigator.pop(
                        context,
                        controller.selectedTopics.toList(),
                      );
                      onDone(controller.selectedTopics.toList());
                    },
                    text: 'Save',
                    fontSize: 16.sp,
                    fontName: FontFamily.inter,
                  ),
                ],
              ),
              if (maritalStatuses == null) ...[
                CustomText(
                  text: 'Topics of interest',
                  fontSize: 16.sp,
                  top: 10.h,
                  fontName: FontFamily.inter,
                  fontWeight: FontWeight.w500,
                ),
                CustomText(
                  text: 'Select up to 5 topics',
                  fontSize: 16.sp,
                  fontName: FontFamily.inter,
                  color: AppColors.secondaryColor,
                ),
                SizedBox(height: 10.h),
                // Topics selection using GetX controller
                Obx(() {
                  return Wrap(
                    spacing: 8.w,
                    runSpacing: 6.h,
                    // children: HelperData.topics.map((topic) {
                    //   bool isSelected = controller.selectedTopics.contains(
                    //     topic,
                    //   );
                    //   return CustomContainer(
                    //     color: isSelected
                    //         ? AppColors.primaryColor
                    //         : AppColors.bgColor,
                    //     bordersColor: isSelected
                    //         ? AppColors.bgColor
                    //         : AppColors.primaryColor,
                    //     radiusAll: 100.r,
                    //     paddingHorizontal: 16.w,
                    //     paddingVertical: 8.h,
                    //     onTap: () {
                    //       if (!isSelected &&
                    //           controller.selectedTopics.length >= 5) {
                    //         ToastMessageHelper.showToastMessage(
                    //           'You can select up to 5 topics only',
                    //           actionColor: Colors.red,
                    //         );
                    //         return;
                    //       }
                    //       controller.toggleTopic(topic);
                    //     },
                    //     child: CustomText(
                    //       text: topic,
                    //       fontName: FontFamily.inter,
                    //       fontSize: 12.sp,
                    //     ),
                    //   );
                    // }).toList(),
                  );
                }),

                SizedBox(height: 32.h),
              ],
              if (maritalStatuses != null) ...[
                CustomText(
                  text: 'Marital status',
                  fontSize: 16.sp,
                  top: 10.h,
                  fontName: FontFamily.inter,
                  fontWeight: FontWeight.w500,
                ),
                CustomText(
                  text: 'Choose your marital status',
                  fontSize: 16.sp,
                  fontName: FontFamily.inter,
                  color: AppColors.secondaryColor,
                ),
                SizedBox(height: 10.h),

                // Marital status chips
                Obx(() {
                  return Wrap(
                    spacing: 8.w,
                    runSpacing: 6.h,
                    children: maritalStatuses.map((status) {
                      bool isSelected =
                          controller.selectedMaritalStatus.value == status;
                      return CustomContainer(
                        color: isSelected
                            ? AppColors.primaryColor
                            : AppColors.bgColor,
                        bordersColor: isSelected
                            ? AppColors.bgColor
                            : AppColors.primaryColor,
                        radiusAll: 100.r,
                        paddingHorizontal: 16.w,
                        paddingVertical: 8.h,
                        onTap: () {
                          controller.setMaritalStatus(status);
                        },
                        child: CustomText(
                          text: status,
                          fontName: FontFamily.inter,
                          fontSize: 12.sp,
                        ),
                      );
                    }).toList(),
                  );
                }),
              ],
              // Marital Status selection using GetX controller
            ],
          ),
        );
      },
    );
  }

  /// Method to pick an image.
  static Future<void> _pickImage(
    Function(File) onFilePicked, {
    required ImageSource source,
  }) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      onFilePicked(File(pickedFile.path));
    }
  }

  /// Method to pick a video.
  static Future<void> _pickVideo(
    Function(File) onFilePicked, {
    required ImageSource source,
  }) async {
    final XFile? pickedFile = await _picker.pickVideo(source: source);
    if (pickedFile != null) {
      onFilePicked(File(pickedFile.path));
    }
  }
}

class BottomSheetController extends GetxController {
  var selectedTopics = <String>{}.obs;
  var selectedMaritalStatus = ''.obs;

  void toggleTopic(String topic) {
    if (selectedTopics.contains(topic)) {
      selectedTopics.remove(topic);
    } else {
      selectedTopics.add(topic);
    }
  }

  void setMaritalStatus(String status) {
    selectedMaritalStatus.value = selectedMaritalStatus.value == status
        ? ''
        : status;
  }
}
