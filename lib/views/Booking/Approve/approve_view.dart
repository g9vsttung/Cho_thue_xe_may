import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/view_model/approve_view_model.dart';
import 'package:chothuexemay_mobile/views/Booking/Approve/components/body.dart';
import 'package:chothuexemay_mobile/views/Components/app_bar.dart';
import 'package:chothuexemay_mobile/views/Components/botton_app_bar.dart';
import 'package:chothuexemay_mobile/views/Home/home_view.dart';
import 'package:flutter/material.dart';

class ApproveView extends StatelessWidget {
  ApproveViewModel info;

  ApproveView({required this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarTitle(
            title: "Thông tin đặt",
            func: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return HomeView();
                },
              ));
            }),
      ),
      body: BodyApprove(
        info: info,
      ),
      bottomNavigationBar: BottomAppBar(
        color: ColorConstants.background,
        child: BottomBar(selected: "home"),
      ),
    );
  }
}
