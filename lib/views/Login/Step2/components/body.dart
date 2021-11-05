// ignore_for_file: must_be_immutable, avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, deprecated_member_use, no_logic_in_create_state

import 'package:chothuexemay_mobile/view_model/authservice.dart';
import 'package:chothuexemay_mobile/views/Home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class LoginBodyStep extends StatefulWidget {
  Size size;
  String phone;
  LoginBodyStep({
    Key? key,
    required this.size,
    required this.phone,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginBodyStep();
  }
}

class _LoginBodyStep extends State<LoginBodyStep> {
  String errorMessage = "";

  final int _start = 10;
  final TextEditingController otpController = TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<AuthService>(context, listen: false)
        .verifyPhone(widget.phone, context);
    errorMessage =
        Provider.of<AuthService>(context, listen: false).errorMessage;
  }

  //Not Wroking well.
  void startTimer() {
    // const oneSec = const Duration(seconds: 1);
    // _timer = new Timer.periodic(
    //   oneSec,
    //   (Timer timer) {
    //     if (_start == 0) {
    //       setState(() {
    //         timer.cancel();
    //       });
    //     } else {
    //       setState(() {
    //         _start--;
    //       });
    //     }
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    final AuthService _service = Provider.of<AuthService>(context);
    startTimer();
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
            right: widget.size.width * 0.07,
            left: widget.size.width * 0.07,
            top: widget.size.height * 0.25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Vui Lòng Nhập Mã Xác Minh",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Mã xác minh của bạn sẽ được gửi qua SMS",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              widget.phone,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            if (errorMessage.isEmpty)
              SizedBox(
                height: 15,
              )
            else
              Text(
                errorMessage,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontStyle: FontStyle.italic),
              ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 45,
              width: widget.size.width * 0.6,
              child: TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(64, 152, 62, 1)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    contentPadding:
                        EdgeInsets.only(top: 5, bottom: 5, left: 25)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            if (_start > 0)
              Text(
                "Vui long chờ ${_start}s để gửi lại",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontStyle: FontStyle.italic),
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bạn không nhận được mã? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      "Gửi lại",
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                ],
              ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () async {
                    bool success = await _service.signInWithOTP(
                        otpController.text, _service.verificationId);

                    if (success) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return HomeView();
                        },
                      ));
                    } else {
                      if (_service.errorMessage.isNotEmpty) {
                        //Login Error for wrong otp or blocked user by Firebase
                        setState(() {
                          errorMessage = _service.errorMessage;
                        });
                      } else {
                        //New User

                      }
                    }
                  },
                  child: Text(
                    "Đăng nhập",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  color: Color.fromRGBO(110, 215, 152, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
