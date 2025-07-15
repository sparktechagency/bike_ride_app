import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/gen/assets.gen.dart';
import 'package:bike_ride_app/view/widgets/custom_container.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:bike_ride_app/view/widgets/custom_text_field.dart';
import 'package:bike_ride_app/view/widgets/dummy_widget.dart';
import 'package:bike_ride_app/view/widgets/list_tile_widget.dart';
import 'package:bike_ride_app/view/widgets/show_buy_credits_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({super.key});

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  final TextEditingController _amountTEController = TextEditingController();
  final List<Map<String, dynamic>> paymentHistory = [
    {
      'leading': Assets.icons.spendCreditsIcon.path,
      'title': "Join a rides",
      'subTitle': "Today at 09:20 am",
      "trailing": "-1 Credit",
    },
    {
      'leading': Assets.icons.addCreditsIcon.path,
      'title': "Add in Wallet",
      'subTitle': "Today at 10:20 am",
      "trailing": "50 Credit",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "My Wallet",
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _cardForShowBalance(),
              SizedBox(height: 24.h),
              CustomButton(
                label: 'Buy More Credits',
                onPressed: () {
                  showBuyCreditsDialog(amountTEController: _amountTEController,context: context);
                },
                width: 314.w,
              ),
              SizedBox(height: 40.h),
              ListView.builder(
                itemCount: paymentHistory.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final items = paymentHistory[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: ListTileWidget(
                      leading: SvgPicture.asset(items['leading']),
                      bgColor: AppColors.grey50,
                      title: items['title'],
                      titleSize: 16.sp,
                      subtitle: items['subTitle'],
                      subtitleColor: AppColors.grey200,
                      suffix: CustomText(
                        text: items['trailing'],
                        color: index == 0
                            ? AppColors.errorColor
                            : AppColors.secondaryColor,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> buyCreditsDialog(BuildContext context) {
    return showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return AlertDialog(
                      title: CustomContainer(
                        height: 251.h,
                        width: 335.w,
                        color: Colors.white,
                        radiusAll: 8.r,
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 24.h),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 24.w,
                                  ),
                                  child: CustomTextField(
                                    controller: _amountTEController,
                                    borderRadio: 8.r,
                                    filColor: AppColors.grey50,
                                    filled: true,
                                    labelText: 'Credit Needs',
                                    hintText: 'Enter your amount',
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                CustomText(
                                  text:
                                      'Each ride costs 1 credits. 1 credit = \$1.',
                                  fontSize: 12.sp,
                                  color: AppColors.secondaryColor,
                                ),
                                SizedBox(height: 11.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: 'Total to pay ',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: AppColors.secondaryColor,
                                    ),
                                    CustomText(text: '\$200'),
                                  ],
                                ),
                                SizedBox(height: 24.h),
                                CustomButton(
                                  label: 'Buy Now',
                                  onPressed: () {},
                                  height: 36.h,
                                  width: 214.w,
                                ),
                              ],
                            ),
                            Positioned(
                              right: 10,
                              top: 0,
                              child: IconButton(
                                onPressed: () {
                                  Get.back();
                                  _amountTEController.clear();
                                },
                                icon: Icon(Icons.close,color: AppColors.errorColor,),
                              ),
                            ),
                          ],
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                    );
                  },
                );
  }

  Widget _cardForShowBalance() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Assets.images.walletImage.image(fit: BoxFit.cover),
        Column(
          children: [
            CustomText(
              text: 'YOUR AVAILABLE CREDIT',
              fontSize: 22.sp,
              color: AppColors.primaryColor,
            ),
            SizedBox(height: 16.h),
            Row(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.icons.coinIcon.svg(height: 50.h, width: 50.w),
                CustomText(text: '40', fontSize: 48.sp, color: Colors.white),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
