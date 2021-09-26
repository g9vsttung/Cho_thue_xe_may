import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/views/Components/brief_info_owner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
class HomeBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: 15, left: size.width*0.04, right: size.width*0.04, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/xeSo.png",width: 70,),
                    Text(
                      "Xe số",
                      style: TextStyle(
                          fontSize: 16,
                          color: ColorConstants.selectedIcon,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/tayGa.png",width: 70,),
                    Text(
                      "Tay ga",
                      style: TextStyle(
                          fontSize: 16,
                          color: ColorConstants.selectedIcon,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/tayCon.png",width: 70,),
                    Text(
                      "Tay côn",
                      style: TextStyle(
                          fontSize: 16,
                          color: ColorConstants.selectedIcon,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35,),
          Text(
            "Đánh giá cao",
            style: TextStyle(
              color: ColorConstants.textBold,
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    BriefInfoOwner(image: "thuexe.png", ownerName: "Nguyễn Vương Bike", totalBike: 13, totalRating: 153, rate: 5, checkCMND: true,onTap: (){},),
                    BriefInfoOwner(image: "thuexe.png", ownerName: "Thành Vương Bike", totalBike: 5, totalRating: 99, rate: 5, checkCMND: false,onTap: (){},),
                    BriefInfoOwner(image: "thuexe.png", ownerName: "Nguyễn Vương Bike sada sada sadas", totalBike: 8, totalRating: 87, rate: 4, checkCMND: false,onTap: (){},),
                    BriefInfoOwner(image: "thuexe.png", ownerName: "Lý Vinh Bike", totalBike: 12, totalRating: 70, rate: 4, checkCMND: true,onTap: (){},),
                    BriefInfoOwner(image: "thuexe.png", ownerName: "Công Hải Bike", totalBike: 9, totalRating: 68, rate: 4, checkCMND: true,onTap: (){},),
                    BriefInfoOwner(image: "thuexe.png", ownerName: "Hà Vương Bike", totalBike: 10, totalRating: 66, rate: 4, checkCMND: false,onTap: (){},)
                  ],
                ),
              )
          )
        ],
      ),
    );
  }

}