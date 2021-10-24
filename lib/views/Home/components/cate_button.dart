import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CateButton extends StatelessWidget {
  String img;
  String cateName;
  String selectedCate;
  Function() onTap;

  CateButton(
      {required this.img,
      required this.cateName,
      required this.selectedCate,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.black;
    Color containerColor = Colors.white;
    if (selectedCate == cateName) {
      textColor = Colors.white;
      containerColor = Color.fromRGBO(47, 147, 31, 1);
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(StringConstants.iconDirectory + img),
              SizedBox(
                height: 5,
              ),
              Text(
                cateName,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor),
              )
            ],
          )),
    );
  }
}
