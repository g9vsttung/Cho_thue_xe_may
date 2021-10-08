// ignore_for_file: must_be_immutable, prefer_const_constructors, sized_box_for_whitespace, deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:chothuexemay_mobile/models/owner_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/view_model/owner_view_model.dart';
import 'package:chothuexemay_mobile/views/Components/bike_info.dart';
import 'package:chothuexemay_mobile/views/Components/pick_function_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class OwnerDetailBody extends StatefulWidget {
  String id;
  double rate;
  OwnerDetailBody({Key? key, required this.id, required this.rate})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _OwnerDetailBody();
  }
}

class _OwnerDetailBody extends State<OwnerDetailBody> {
  String selected = "Moto";
  @override
  void initState() {
    super.initState();
    Provider.of<OwnerViewModel>(context, listen: false).getOwnerById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Owner? owner = Provider.of<OwnerViewModel>(context).owner;
    return Stack(
      children: [
        //==========================
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                //======================IMAGE
                Container(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2.0,
                    ),
                    items: [
                      Image.asset(StringConstants.imageDirectory + "thuexe.png",
                          width: size.width * 0.8),
                      Image.asset(
                          StringConstants.imageDirectory + "thuexe1.png",
                          width: size.width * 0.8),
                      Image.asset(
                          StringConstants.imageDirectory + "thuexe2.png",
                          width: size.width * 0.8),
                    ],
                  ),
                ),
                //========================BIKE
                SizedBox(
                  height: 10,
                ),
                //===NAME & RATE
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (owner != null)
                      Text(
                        owner.fullname,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.textBold,
                            fontSize: 18),
                      ),
                    Container(
                      decoration: BoxDecoration(
                        color: ColorConstants.containerBoldBackground,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, bottom: 5, top: 5),
                        child: Row(
                          children: [
                            Text(
                              widget.rate.toString(),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              StringConstants.iconDirectory + "star.png",
                              width: 15,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PickFuntionButton(
                      text: "Moto",
                      selected: selected,
                      func: () {
                        setState(() {
                          selected = "Moto";
                        });
                      },
                      sizeButton: size.width * 0.25,
                    ),
                    PickFuntionButton(
                      text: "Reviews",
                      selected: selected,
                      func: () {
                        setState(() {
                          selected = "Reviews";
                        });
                      },
                      sizeButton: size.width * 0.33,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(width: 1, color: Colors.black54))),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                //===LIST
                if (owner != null) getFunctionList(owner)
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Container(
                width: size.width * 0.4,
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "ĐẶT XE",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  color: Colors.red,
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Column getFunctionList(Owner owner) {
    List<Widget> childs = [];
    if (selected == "Moto")
      return Column(
        children: [
          BikeInfo(
              image: "yamahaEx.png",
              brand: "Yamaha",
              name: "Exciter",
              color: "blue",
              year: 2020,
              bienSo: "17AB-SD45"),
          BikeInfo(
              image: "yamahaEx.png",
              brand: "Yamaha",
              name: "Exciter",
              color: "blue",
              year: 2020,
              bienSo: "17AB-SD45"),
          BikeInfo(
              image: "yamahaEx.png",
              brand: "Yamaha",
              name: "Exciter",
              color: "blue",
              year: 2020,
              bienSo: "17AB-SD45"),
          BikeInfo(
              image: "yamahaEx.png",
              brand: "Yamaha",
              name: "Exciter",
              color: "blue",
              year: 2020,
              bienSo: "17AB-SD45"),
        ],
      );
    else
      return Column();
  }
}
