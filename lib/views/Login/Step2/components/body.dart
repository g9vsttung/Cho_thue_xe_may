import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class LoginBodyStep extends StatefulWidget {
  Size size;
  String phone;
  bool status=true;
  int countDown=10;

  LoginBodyStep({required this.size, required this.phone});



  @override
  State<StatefulWidget> createState() {
    return _LoginBodyStep();
  }
}
class _LoginBodyStep extends State<LoginBodyStep>{
  countDownFunction(){
    if(widget.countDown > 0)
      sleep(Duration(seconds: 1));
      setState(() {
        widget.countDown -= 1;
      });
  }
  @override
  Widget build(BuildContext context) {

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
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Mã xác minh của bạn sẽ được gửi bằng tin nhắn đến",
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              widget.phone,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            ),
            //======================================STATUS
            SizedBox(
              height: 15,
            ),
            if(widget.status)
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
            //=================================BUTTON
            SizedBox(height: 20,),
            Container(
              height: 45,
              width: widget.size.width*0.6,
              child: TextField(
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

            if(widget.countDown > 0)
              Text(
                "Vui long chờ ${widget.countDown}s để gửi lại",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontStyle: FontStyle.italic
                ),
              )
            else
              Row(
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
                  onPressed: () {},
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
