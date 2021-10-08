// ignore_for_file: must_be_immutable, prefer_const_constructors, sized_box_for_whitespace

import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BikeInfo extends StatelessWidget {
  String image;
  String brand;
  String name;
  String color;
  int year;
  String bienSo;

  BikeInfo(
      {Key? key,
      required this.image,
      required this.brand,
      required this.name,
      required this.color,
      required this.year,
      required this.bienSo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: ColorConstants.containerBackground,
              ),
              child: Padding(
                  padding:
                      EdgeInsets.only(right: 5, top: 10, bottom: 10, left: 10),
                  child: Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                child: Image.asset(
                                  StringConstants.imageDirectory + image,
                                  width: size.width * 0.30,
                                  height: size.width * 0.30,
                                  fit: BoxFit.fill,
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: size.width * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Hãng: $brand",
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Loại xe: $name",
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Màu: $color",
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Đời xe: $year",
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Biển: $bienSo",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ))),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
