import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/view/widgets/custom_network_image.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:bike_ride_app/view/widgets/dummy_widget.dart';
import 'package:bike_ride_app/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InviteMembersScreen extends StatefulWidget {
  const InviteMembersScreen({super.key});

  @override
  State<InviteMembersScreen> createState() => _InviteMembersScreenState();
}

class _InviteMembersScreenState extends State<InviteMembersScreen> {
  int? selectedIndex;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            children: [
              TextFieldWidget(
                hintText: 'Search by name or email',
                borderColor: Color(0xFFC1C1C1),
              ),
              SizedBox(height: 16.h),
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final isSelected = selectedIndex == index;
                  return ListTile(
                    contentPadding: EdgeInsets.only(
                      left: 0,
                      right: 0,
                      bottom: 12,
                    ),
                    leading: CustomNetworkImage(
                      imageUrl: "https://i.pravatar.cc/150?img=${index + 1}",
                      height: 45.h,
                      width: 45.w,
                      boxShape: BoxShape.circle,
                      border: Border.all(color: AppColors.primaryColor),
                    ),
                    title: CustomText(
                      text: 'Alex James',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.start,
                    ),
                    subtitle: CustomText(
                      text: 'a2bc23@gmail.com',
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: AppColors.greyColor,
                      textAlign: TextAlign.start,
                    ),
                    trailing: CustomButton(
                      label: isSelected ? "Invited" : 'Invite',
                      backgroundColor: isSelected
                          ? AppColors.primaryColor.withOpacity(.3)
                          : null,
                      onPressed: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      height: 24.h,
                      fontSize: 12.sp,
                      width: 65.w,
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
}
