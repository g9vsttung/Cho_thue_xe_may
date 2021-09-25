import 'package:chothuexemay_mobile/views/Login/Step1/login_view_1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spa Booking',
      theme: ThemeData(
        primaryColor: Color(0xFFFFEBEE),
        scaffoldBackgroundColor: Colors.white,
      ),

      home: LoginView1(),
    )
    ;
  }
}

