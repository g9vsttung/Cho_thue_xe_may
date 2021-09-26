
import 'dart:async';

import 'package:chothuexemay_mobile/views/Home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class LoginBodyStep extends StatefulWidget {
  Size size;
  String phone;
  String otp;
  LoginBodyStep({required this.size, required this.phone,required this.otp});

  @override
  State<StatefulWidget> createState() {
    return _LoginBodyStep();
  }
}
class _LoginBodyStep extends State<LoginBodyStep>{
  bool status=true;
  int countDown=10;
  TextEditingController otpController=TextEditingController();
  countDownFunc() async{
     if(countDown>0)
        await Future.delayed(const Duration(milliseconds: 1000), () {
            setState(() {
              countDown--;
            });
      });
  }
  @override
  Widget build(BuildContext context) {
    countDownFunc();

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
            //=======================================PHONE
            Text(
              widget.phone,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
            //======================================STATUS
            SizedBox(
              height: 15,
            ),
            if(status)
              SizedBox(
                height: 15,
              )
            else
              Text(
                "Mã xác minh không hợp lệ",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontStyle: FontStyle.italic
                ),
              )
            ,
            //=================================TEXT FIELD
            SizedBox(height: 20,),
            Container(
              height: 45,
              width: widget.size.width*0.6,
              child: TextField(
                controller: otpController,
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
            //=================================RESENT
            SizedBox(
              height: 15,
            ),

            if(countDown > 0)
              Text(
                "Vui long chờ ${countDown}s để gửi lại",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontStyle: FontStyle.italic
                ),
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
                      style: TextStyle(
                        color: Colors.red
                      ),
                    ),
                  )
                ],
              )
            ,
            //===================================BUTTON
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {
                    if(widget.otp == otpController.text){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return HomeView();
                      },));
                    }else{
                      setState(() {
                        status=false;
                      });
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
