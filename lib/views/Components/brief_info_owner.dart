import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
class BriefInfoOwner extends StatelessWidget{
  String image;
  String ownerName;
  int totalBike;
  int totalRating;
  int rate;
  bool checkCMND;
  void Function() onTap;
  BriefInfoOwner({required this.image, required this.ownerName, required this.totalBike, required this.totalRating, required this.rate,required this.checkCMND, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),color: ColorConstants.briefBackground,),

            child: Padding(
                padding: EdgeInsets.only(right: 5,top: 10,bottom: 10,left: 10),
                child: Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: onTap,
                          child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              child: Image.asset(StringConstants.imageDirectory + image,width: size.width*0.25,height: size.width*0.25, fit: BoxFit.fill,)
                          ),
                        )
                        ,
                        SizedBox(width: 10,),
                        Container(
                          width: size.width*0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: onTap,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    child: Text(
                                      ownerName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: ColorConstants.textBold,
                                          fontSize: 16
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    )
                                ),
                              )
                              ,
                              SizedBox(height: 5,),
                              Text(
                                "Tổng xe: $totalBike chiếc",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14
                                ),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  for(int i =1;i <= rate;i++)
                                    Image.asset(StringConstants.iconDirectory+"star.png",width: 14,),

                                  for(int j =1;j <= 5-rate;j++)
                                    Image.asset(StringConstants.iconDirectory+"star.png",width: 14,color: ColorConstants.unavailableStar,),
                                  SizedBox(width: 5,),
                                  Text(
                                    "($totalRating lượt)",
                                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
                                  )
                                ],
                              ),
                              SizedBox(height: 5,),
                              if(checkCMND)
                                Text(
                                  "*Cần xác thực CMND.",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic,
                                      color: Color.fromRGBO(31, 135, 6, 1)
                                  ),
                                )
                              else
                                Text(
                                  "*Không cần xác thực CMND.",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.red
                                  ),
                                ),
                            ],
                          ),
                        )

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(StringConstants.iconDirectory + "location.png",width: 30,)
                      ],
                    )
                  ],
                )
            )
        ),
        SizedBox(height: 12,)
      ],
    );
  }

}