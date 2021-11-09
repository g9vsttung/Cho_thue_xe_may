// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/views/Home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodyNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            StringConstants.iconDirectory + "noResult.png",
            width: size.width * 0.7,
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: size.width * 0.7,
            child: const Text(
              "Xin lỗi bạn, hiện không có xe nào phù hợp!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (context) {
                  return HomeView();
                },
              ), (route) => false);
            },
            color: Colors.orange,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: const Text(
              "Trở về trang chủ",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
