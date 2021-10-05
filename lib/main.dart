import 'package:chothuexemay_mobile/view_model/owner_view_model.dart';
import 'package:chothuexemay_mobile/views/Home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OwnerViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Spa Booking',
        theme: ThemeData(
          primaryColor: Color(0xFFFFEBEE),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: HomeView(),
      ),
    );
  }
}
