// ignore_for_file: prefer_const_constructors

import 'package:chothuexemay_mobile/models/motor_type_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/view_model/customer_view_model.dart';
import 'package:chothuexemay_mobile/view_model/motor_type_view_model.dart';
import 'package:chothuexemay_mobile/views/Components/app_bar_main.dart';
import 'package:chothuexemay_mobile/views/Components/botton_app_bar.dart';
import 'package:chothuexemay_mobile/views/Home/components/body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  Future<List<MotorType>> getData(BuildContext context) async {
    await Provider.of<MotorTypeViewModel>(context, listen: false).getAll();
    return Provider.of<MotorTypeViewModel>(context, listen: false).types;
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<CustomerViewModel>(context).getData();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarMain(),
      ),
      body: FutureBuilder(
        builder: (context, napshot) {
          if (napshot.connectionState == ConnectionState.done) {
            if (napshot.hasData) {
              final List<MotorType> types = napshot.data as List<MotorType>;
              return BodyHome(types: types);
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
        future: getData(context),
      ),
      //BodyHome(),
      bottomNavigationBar: BottomAppBar(
        color: ColorConstants.background,
        child: BottomBar(selected: "home"),
      ),
    );
  }
}
