import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:flutter/material.dart';
class BottomBar extends StatelessWidget {
  String selected="";

  BottomBar({required this.selected});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.only(top: 7,bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if(selected == "home")
            GestureDetector(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/home.png",color: ColorConstants.selectedIcon,width: 30,),
                  Text(
                    "Trang chủ",
                    style: TextStyle(
                        fontSize: 12,
                        color: ColorConstants.selectedIcon
                    ),
                  )
                ],
              ),
            )
          else
            GestureDetector(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/home.png",color: ColorConstants.normalIcon,width: 30,),
                  Text(
                    "Trang chủ",
                    style: TextStyle(
                        fontSize: 12,
                        color: ColorConstants.normalIcon
                    ),
                  )
                ],
              ),
            )
          ,
          //=============================================================SEARCH
          if(selected == "search")
            GestureDetector(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/search.png",color: ColorConstants.selectedIcon,width: 30,),
                  Text(
                    "Tìm Kiếm",
                    style: TextStyle(
                        fontSize: 12,
                        color: ColorConstants.selectedIcon
                    ),
                  )
                ],
              ),
            )
          else
            GestureDetector(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/search.png",color: ColorConstants.normalIcon,width: 30,),
                  Text(
                    "Tìm kiếm",
                    style: TextStyle(
                        fontSize: 12,
                        color: ColorConstants.normalIcon
                    ),
                  )
                ],
              ),
            )
          ,
          //=============================================schedule
          if(selected == "schedule")
            GestureDetector(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/schedule.png",color: ColorConstants.selectedIcon,width: 30,),
                  Text(
                    "Lịch đặt",
                    style: TextStyle(
                        fontSize: 12,
                        color: ColorConstants.selectedIcon
                    ),
                  )
                ],
              ),
            )
          else
            GestureDetector(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/schedule.png",color: ColorConstants.normalIcon,width: 30,),
                  Text(
                    "Lịch đặt",
                    style: TextStyle(
                        fontSize: 12,
                        color: ColorConstants.normalIcon
                    ),
                  )
                ],
              ),
            )
          ,
          //================================================PROFILE
          if(selected == "profile")
            GestureDetector(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/profile.png",color: ColorConstants.selectedIcon,width: 30,),
                  Text(
                    "Cá nhân",
                    style: TextStyle(
                        fontSize: 12,
                        color: ColorConstants.selectedIcon
                    ),
                  )
                ],
              ),
            )
          else
            GestureDetector(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/profile.png",color: ColorConstants.normalIcon,width: 30,),
                  Text(
                    "Cá nhân",
                    style: TextStyle(
                        fontSize: 12,
                        color: ColorConstants.normalIcon
                    ),
                  )
                ],
              ),
            )
          ,
        ],
      ),
    );
  }
}
