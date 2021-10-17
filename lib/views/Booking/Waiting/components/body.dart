import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/view_model/approve_view_model.dart';
import 'package:chothuexemay_mobile/views/Booking/Approve/approve_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodyWaiting extends StatelessWidget {
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
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: size.width * 0.12, right: size.width * 0.12),
              child: Text(
                "Hệ thống đang tìm xe, mong bạn chờ một xíu nhé...",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ApproveView(
                        info: ApproveViewModel("avatar.png", "Hoang Anh Biker",
                            4, "55-GA 12548 ", "Air Black", "bikeApprove.png"));
                  },
                ));
              },
              child: Text("Khi thấy thì cho chạy cái Navigator.push này"),
            )
          ],
        )
      ],
    );
  }
}
