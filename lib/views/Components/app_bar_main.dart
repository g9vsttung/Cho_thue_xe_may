// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class TopAppBarMain extends StatefulWidget {
  const TopAppBarMain({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TopAppBarMain();
  }
}

class _TopAppBarMain extends State<TopAppBarMain> {
  String dropDownValue = "22A Đường Số 7";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.green[200],
            ),
            child: DropdownButton(
                value: dropDownValue,
                onChanged: (selected) {
                  setState(() {
                    dropDownValue = selected.toString();
                  });
                },
                iconSize: 20,
                icon: Image.asset("assets/icons/dropDown.png"),
                items: <String>[
                  '22A Đường Số 7',
                  '22B Đường Số 35',
                  '22A Đường Số 8'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  );
                }).toList()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/icons/chatMark.png",
                    width: 40,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/icons/notificationMark.png",
                    width: 40,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
