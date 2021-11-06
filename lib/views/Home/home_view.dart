// ignore_for_file: prefer_const_constructors

import 'package:chothuexemay_mobile/models/motor_type_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/view_model/customer_view_model.dart';
import 'package:chothuexemay_mobile/view_model/motor_type_view_model.dart';
import 'package:chothuexemay_mobile/views/Components/app_bar.dart';
import 'package:chothuexemay_mobile/views/Components/botton_app_bar.dart';
import 'package:chothuexemay_mobile/views/Home/components/body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
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
