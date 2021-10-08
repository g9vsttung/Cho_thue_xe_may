// ignore_for_file: must_be_immutable, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class TopAppBarTitle extends StatefulWidget {
  String title;
  TopAppBarTitle({Key? key, required this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _TopAppBarTitle();
  }
}

class _TopAppBarTitle extends State<TopAppBarTitle> {
  String dropDownValue = "22A Đường Số 7";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Stack(alignment: Alignment.centerLeft, children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18),
                  ),
                )
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                "assets/icons/back.png",
                width: size.width * 0.07,
                color: Colors.white,
              )),
        ]));
  }
}
