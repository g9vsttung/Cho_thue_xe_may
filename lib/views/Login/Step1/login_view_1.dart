// ignore_for_file: prefer_const_constructors

import 'package:chothuexemay_mobile/views/Login/Step1/components/body.dart';
import 'package:flutter/material.dart';

class LoginView1 extends StatefulWidget {
  const LoginView1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginView1();
  }
}

class _LoginView1 extends State<LoginView1> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: LoginBody(
          size: size,
        ),
      ),
    );
  }
}
