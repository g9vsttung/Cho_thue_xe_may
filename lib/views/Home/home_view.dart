// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:chothuexemay_mobile/models/motor_type_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/view_model/customer_view_model.dart';
import 'package:chothuexemay_mobile/view_model/motor_type_view_model.dart';
import 'package:chothuexemay_mobile/views/Components/app_bar.dart';
import 'package:chothuexemay_mobile/views/Components/botton_app_bar.dart';
import 'package:chothuexemay_mobile/views/Home/components/body.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
   HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<Map<String, dynamic>> getData(BuildContext context) async {
    Map<String, dynamic> list = {};

    await Provider.of<CustomerViewModel>(context, listen: false).getData();

    list['address'] =
        Provider.of<CustomerViewModel>(context, listen: false).address;

    await await Provider.of<MotorTypeViewModel>(context, listen: false)
        .getAll();
    list['types'] =
        Provider.of<MotorTypeViewModel>(context, listen: false).types;

    return list;
  }

  void firebaseCloudMessaging_Listeners() {
    _fcm.getToken().then((token) async {});

    FirebaseMessaging.onMessage.listen((RemoteMessage evt) {
      final data = jsonDecode(evt.data["data"]);
      if(data["action"]!="confirm"){
        return;
      }
      String licensePlate=data["licensePlate"];
      Future<dynamic> futureValue = showGeneralDialog(
        context: context,
        pageBuilder: (context, animation, secondaryAnimation) {
          return Dialog(
            child: Container(
              decoration: const BoxDecoration(
                color: ColorConstants.containerBackground,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Bạn đã nhận được xe có biển số ["+licensePlate+"]?",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      maxLines: 3,
                    ),
                    const SizedBox(
                      height: 15
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RaisedButton(
                          onPressed: () {

                          },
                          color: Colors.red,
                          child: const Text("Không"),
                        ),
                        SizedBox(width: 2,),
                        RaisedButton(
                          onPressed: () {

                          },
                          color: ColorConstants.containerBoldBackground,
                          child: const Text("Xác nhận"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.white,
          );
        },
      );


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarTitle(
          title: "Trang chủ",
          hasBack: false,
        ),
      ),
      body: FutureBuilder(
        builder: (context, napshot) {
          if (napshot.connectionState == ConnectionState.done) {
            if (napshot.hasData) {
              final List<MotorType> types =
                  (napshot.data as dynamic)['types'] as List<MotorType>;
              final String address =
                  (napshot.data as dynamic)['address'] as String;
              return BodyHome(types: types, address: address);
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
        future: getData(context),
      ),
      bottomNavigationBar: BottomAppBar(
        color: ColorConstants.background,
        child: BottomBar(selected: "home"),
      ),
    );
  }
}
