import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/gen/assets.gen.dart';
import 'package:bike_ride_app/rides/rides_screen.dart';
import 'package:bike_ride_app/view/screens/groups/groups_screen.dart';
import 'package:bike_ride_app/view/screens/home/home_screen.dart';
import 'package:bike_ride_app/view/screens/rides_schedule/rides_schedule_screen.dart';
import 'package:bike_ride_app/view/widgets/custom_container.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _bottomNavBarIcons = [
    {'icon': Assets.icons.homeIcon.path, 'name': "Home"},
    {'icon': Assets.icons.groupIcon.path, 'name': "Groups"},
    {'icon': Assets.icons.rideSchedule.path, 'name': "Schedule"},
    {'icon': Assets.icons.ridesIcon.path, 'name': "Rides"},
  ];
  final List<Widget> _screens = [
    // Center(child: CustomText(text: 'Home')),
    HomeScreen(),
    // Center(child: CustomText(text: 'Groups')),
    GroupsScreen(),
    // Center(child: CustomText(text: 'Schedule')),
    RidesScheduleScreen(),
    // Center(child: CustomText(text: 'Rides')),
    RidesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomContainer(
        alignment: Alignment.center,
        height: 90.h,
        color: AppColors.primaryColor.withOpacity(.1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(_bottomNavBarIcons.length, (index) {
            final isSelected = _selectedIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    _bottomNavBarIcons[index]['icon'],
                    color: isSelected ? AppColors.bottomNavColor : null,
                  ),
                  isSelected
                      ? CustomText(
                          text: _bottomNavBarIcons[index]['name'],
                          color: isSelected ? AppColors.bottomNavColor : null,
                        )
                      : SizedBox.shrink(),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
