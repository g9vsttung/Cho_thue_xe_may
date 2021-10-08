// ignore_for_file: prefer_const_constructors

import 'package:chothuexemay_mobile/services/authservice.dart';
import 'package:chothuexemay_mobile/view_model/customer_view_model.dart';
import 'package:chothuexemay_mobile/view_model/owner_view_model.dart';
import 'package:chothuexemay_mobile/views/Login/Step1/login_view_1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthService>(create: (create) => AuthService()),
        ChangeNotifierProvider<CustomerViewModel>(
            create: (context) => CustomerViewModel()),
        ChangeNotifierProvider<OwnerViewModel>(
            create: (context) => OwnerViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Spa Booking',
        theme: ThemeData(
          primaryColor: Color(0xFFFFEBEE),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: LoginView1(),
      ),
    );
  }
}
