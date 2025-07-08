import 'dart:io';

import 'package:bike_ride_app/app/helpers/image_picker_helper.dart';
import 'package:bike_ride_app/app/routes/app_routes.dart';
import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/gen/fonts.gen.dart';
import 'package:bike_ride_app/view/widgets/custom_bottom_sheet.dart';
import 'package:bike_ride_app/view/widgets/custom_container.dart';
import 'package:bike_ride_app/view/widgets/custom_dialog.dart';
import 'package:bike_ride_app/view/widgets/custom_global_app_bar.dart';
import 'package:bike_ride_app/view/widgets/custom_network_image.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:bike_ride_app/view/widgets/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InboxMessageScreen extends StatefulWidget {
  const InboxMessageScreen({super.key});

  @override
  State<InboxMessageScreen> createState() => _InboxMessageScreenState();
}

class _InboxMessageScreenState extends State<InboxMessageScreen> {
  final TextEditingController _messageTextController = TextEditingController();
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ImagePickerHelper _imagePickerHelper = ImagePickerHelper();
  File? _image;
  final List<Map<String, dynamic>> messages = [
    {
      "text":
          "Hey there! Haven't seen long day . where are you? can we meet in this sunday . i'm planning about to host a dinner with you",
      "isMe": false,
      "type": "text",
    },
    {
      "text": "Here is the picture i'm sharing with you",
      "isMe": false,
      "type": "text",
    },
    {
      "text":
          "Hi! How are you?. where are you? can we meet in this sunday . i'm planning about to host a dinner with you",
      "isMe": true,
      "type": "text",
    },

    {"text": "I'm good, thanks!", "isMe": false, "type": "text"},
    {"text": "Great to hear!", "isMe": true, "type": "text"},
  ];
  final List<String> bottomSheetButton = [
    'View Profile',
    'Media',
    'Block Profile',
  ];

  // List<VoidCallback> bottomSheetButtonAction(BuildContext context) {
  //   return [
  //         () {
  //       Get.toNamed(AppRoutes.userProfileScreen);
  //     },
  //         () {
  //       ///for button 2 action
  //       Get.toNamed(AppRoutes.mediaScreen);
  //     },
  //         () {
  //       _showDialog(context);
  //     },
  //   ];
  // }

  void _showDialog(BuildContext context) {
    customPopUpWidget(
      context: context,
      title: "Block",
      subtitle: 'Are you sure want to block this user?',
      firstButton: 'Cancel',
      lastButton: 'Block',
    );
  }

  void sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      messages.add({
        'text': _controller.text.trim(),
        'isMe': true,
        'type': 'text',
      });
    });
    _controller.clear();
    //scroll to the latest message
    Future.delayed(Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    });
  }

  Future<void> _getPhotoFromGallery() async {
    final image = await _imagePickerHelper.pickFromGallery();
    if (image != null) {
      setState(() {
        _image = image;
        messages.add({'image': _image, "isMe": true, 'type': 'image'});
      });
    }
    //scroll to the latest message
    Future.delayed(Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    });
  }

  Future<void> _getPhotoFromCamera() async {
    final image = await _imagePickerHelper.pickFromCamera();
    if (image != null) {
      setState(() {
        _image = image;
        messages.add({'image': _image, "isMe": true, 'type': 'image'});
      });
    }
    //scroll to the latest message
    Future.delayed(Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        // leading: SizedBox.shrink(),
        title: ListTile(
          onTap: () {
            Get.toNamed(AppRoutes.groupDetailsScreen);
          },
          leading: CustomNetworkImage(
            imageUrl: "https://i.pravatar.cc/150?img=38",
            height: 40.h,
            width: 40.w,
            boxShape: BoxShape.circle,
          ),
          title: CustomText(
            text: 'Technical Group',
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.start,
          ),
          subtitle: CustomText(
            text: 'Online(3 members)',
            fontSize: 12.sp,
            textAlign: TextAlign.start,
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: messages.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final isMe = messages[index]['isMe'] as bool;
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: _chatBubbleMessage(isMe, context, index),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 16.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // Align to the bottom
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextFieldWidget(
                            controller: _controller,
                            textInputAction: TextInputAction.newline,
                            hintText: 'Message...',
                            filledColor: Color(0xFFF3F4F6),
                            borderColor: Color(0xFFCBD5E1),
                            maxLine: 4,
                            isPrefixShowing: false,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                customBottomSheet(
                                  context: context,
                                  buttons: ['Gallery', 'Camera'],
                                  onPressedCallbacks: [
                                    () async {
                                      await _getPhotoFromGallery();
                                      if (_image != null) {
                                        Get.back();
                                      }
                                    },
                                    () async {
                                      await _getPhotoFromCamera();
                                      if (_image != null) {
                                        Get.back();
                                      }
                                    },
                                  ],
                                );
                              },
                              child: Icon(
                                CupertinoIcons.camera_fill,
                                color: AppColors.greyColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        GestureDetector(
                          onTap: sendMessage,
                          child: CustomContainer(
                            alignment: Alignment.center,
                            height: 52.h,
                            width: 52.w,
                            shape: BoxShape.circle,
                            color: Color(0xFFF3F4F6),
                            child: Icon(
                              Icons.send,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chatBubbleMessage(bool isMe, BuildContext context, int index) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        // crossAxisAlignment:isMe? CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: isMe
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              isMe
                  ? SizedBox.shrink()
                  : Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CustomNetworkImage(
                          imageUrl: 'https://i.pravatar.cc/150?img=40',
                          height: 30.h,
                          width: 30.w,
                          boxShape: BoxShape.circle,
                        ),
                        CustomContainer(
                          height: 8.h,
                          width: 8.w,
                          color: Color(0xFF1A514B),
                          shape: BoxShape.circle,
                        ),
                      ],
                    ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: isMe
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 6.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 10.h,
                    ),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    decoration: BoxDecoration(
                      color: isMe
                          ? AppColors.primaryColor.withOpacity(.5)
                          : AppColors.neutralColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16.r),
                        topLeft: Radius.circular(16.r),
                        bottomLeft: Radius.circular(isMe ? 16.r : 0.r),
                        bottomRight: Radius.circular(isMe ? 0.r : 16.r),
                      ),
                    ),
                    child: messages[index]['type'] == 'text'
                        ? CustomText(
                            text: messages[index]['text'],
                            textOverflow: TextOverflow.fade,
                            textAlign: TextAlign.start,
                          )
                        : messages[index]['type'] == 'image'
                        ? Image.file(
                            messages[index]['image'],
                            fit: BoxFit.cover,
                            height: 200.h,
                            width: 200.w,
                          )
                        : SizedBox.shrink(),
                  ),
                  CustomText(
                    text: '09:25 AM',
                    fontSize: 10.sp,
                    color: Color(0xFF636F85),
                    // textAlign: TextAlign.end,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageTextController.dispose();
    super.dispose();
  }
}
