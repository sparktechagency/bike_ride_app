import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/gen/assets.gen.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:bike_ride_app/view/widgets/custom_text_field.dart';
import 'package:bike_ride_app/view/widgets/dummy_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateRidesScreen extends StatefulWidget {
  const CreateRidesScreen({super.key});

  @override
  State<CreateRidesScreen> createState() => _CreateRidesScreenState();
}

class _CreateRidesScreenState extends State<CreateRidesScreen> {
  final TextEditingController _groupNameTEController = TextEditingController();
  final TextEditingController _selectTEController = TextEditingController();
  final TextEditingController _startLocationTEController =
      TextEditingController();
  final TextEditingController _endLocationTEController =
      TextEditingController();
  final TextEditingController _pitStopsTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Create Ride",
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            children: [
              CustomTextField(
                controller: _groupNameTEController,
                hintText: 'Create a group name ',
                labelText: "Ride Title",
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                controller: _selectTEController,
                hintText: 'Select Group ',
                labelText: "Select Group",
                suffixIcon: Icon(Icons.arrow_drop_down_outlined, size: 25.h),
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                controller: _startLocationTEController,
                hintText: 'Select Group',
                suffixIcon:Icon(CupertinoIcons.location_solid),
                labelText: "Start Location",
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                controller: _endLocationTEController,
                hintText: 'End Location',
                labelText: "End Location",
                suffixIcon:Icon(CupertinoIcons.location_solid),
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                controller: _pitStopsTEController,
                hintText: 'Pit Stops',
                labelText: "Pit Stops",
              ),
              SizedBox(height: 24.h),
              CustomButton(
                label: 'Pick new pit stops',
                backgroundColor: AppColors.grey50,
                fontColor: AppColors.secondaryColor,
                height: 44.h,
                width: 166.w,
                fontSize: 14.sp,
                onPressed: () {},
                prefix: Icon(
                  Icons.add,
                  color: AppColors.secondaryColor,
                  size: 25.h,
                ),
              ),
              SizedBox(height: 40.h),
              CustomText(text: '💰 Cost: Just 1 credits per ride'),
              SizedBox(height: 24.h),
              CustomButton(label: 'Create Ride', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
