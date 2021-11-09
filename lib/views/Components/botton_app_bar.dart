// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/views/Appointment/appointment_view.dart';
import 'package:chothuexemay_mobile/views/Home/home_view.dart';
import 'package:chothuexemay_mobile/views/Profile/profile_view.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  String selected = "";

  BottomBar({Key? key, required this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 7, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (selected == "home")
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => HomeView(),
                  ),
                  (route) => false,
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/home.png",
                    color: ColorConstants.selectedIcon,
                    width: 35,
                  ),
                  Text(
                    "Trang chủ",
                    style: TextStyle(
                        fontSize: 12, color: ColorConstants.selectedIcon),
                  )
                ],
              ),
            )
          else
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => HomeView(),
                  ),
                  (route) => false,
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/home.png",
                    color: ColorConstants.normalIcon,
                    width: 35,
                  ),
                  Text(
                    "Trang chủ",
                    style: TextStyle(
                        fontSize: 12, color: ColorConstants.normalIcon),
                  )
                ],
              ),
            ),
          if (selected == "schedule")
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => AppointmentView(),
                  ),
                  (route) => false,
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/schedule.png",
                    color: ColorConstants.selectedIcon,
                    width: 35,
                  ),
                  Text(
                    "Lịch đặt",
                    style: TextStyle(
                        fontSize: 12, color: ColorConstants.selectedIcon),
                  )
                ],
              ),
            )
          else
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => AppointmentView(),
                  ),
                  (route) => false,
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/schedule.png",
                    color: ColorConstants.normalIcon,
                    width: 35,
                  ),
                  Text(
                    "Lịch đặt",
                    style: TextStyle(
                        fontSize: 12, color: ColorConstants.normalIcon),
                  )
                ],
              ),
            ),
          if (selected == "profile")
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => ProfileView(),
                  ),
                  (route) => false,
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/profile.png",
                    color: ColorConstants.selectedIcon,
                    width: 35,
                  ),
                  Text(
                    "Cá nhân",
                    style: TextStyle(
                        fontSize: 12, color: ColorConstants.selectedIcon),
                  )
                ],
              ),
            )
          else
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => ProfileView(),
                  ),
                  (route) => false,
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/profile.png",
                    color: ColorConstants.normalIcon,
                    width: 35,
                  ),
                  Text(
                    "Cá nhân",
                    style: TextStyle(
                        fontSize: 12, color: ColorConstants.normalIcon),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
