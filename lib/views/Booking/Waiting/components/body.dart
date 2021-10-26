import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodyWaiting extends StatelessWidget {
  BodyWaiting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              StringConstants.imageDirectory + "loading.gif",
              width: size.width * 0.75,
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: size.width * 0.12, right: size.width * 0.12),
              child: const Text(
                "Hệ thống đang tìm xe, mong bạn chờ một xíu nhé...",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      ],
    );
  }
}
