import 'package:another_flushbar/flushbar.dart';
import 'package:bike_ride_app/gen/fonts.gen.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class ToastMessageHelper{
  static void showToastMessage(String message, {int? secound,Color? actionColor}) {
    final ctx = Get.context;
    if (ctx == null) return;
    Flushbar(
      margin: EdgeInsets.all(8.r),
      borderRadius: BorderRadius.circular(8.r),
      duration: Duration(seconds: secound ?? 3),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.white,
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: message,
            color: actionColor ?? Colors.green,
            fontWeight: FontWeight.w500,
            fontName: FontFamily.inter,
            textAlign: TextAlign.start,
          ),
          // GestureDetector(
          //   onTap: () {
          //     Get.back();
          //   },
          //   child: Assets.icons.cleanIcon.svg(),
          // ),
        ],
      ),
    ).show(ctx);

/*
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: secound ?? 2,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.h,
    );
*/

  }
}