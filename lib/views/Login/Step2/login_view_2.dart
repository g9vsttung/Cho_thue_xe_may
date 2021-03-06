// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:chothuexemay_mobile/views/Login/Step2/components/body.dart';
import 'package:flutter/material.dart';

class LoginView2 extends StatefulWidget {
  String phone;
  LoginView2({Key? key, required this.phone}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginView2();
  }
}

class _LoginView2 extends State<LoginView2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgroundStep.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: LoginBodyStep(size: size, phone: widget.phone),
      ),
    );
  }
}
