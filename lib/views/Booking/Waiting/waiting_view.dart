import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/models/approve_model.dart';
import 'package:chothuexemay_mobile/views/Booking/Approve/components/body.dart';
import 'package:chothuexemay_mobile/views/Booking/Waiting/components/body.dart';
import 'package:chothuexemay_mobile/views/Components/app_bar.dart';
import 'package:chothuexemay_mobile/views/Components/botton_app_bar.dart';
import 'package:flutter/material.dart';

class WaitingView extends StatelessWidget {
  WaitingView({Key? key}) : super(key: key);
  Future<ApproveModel> ownerAccepted() async {
    return ApproveModel("avatar.png", "Nguyễn Văn A", 4, "545-BSF23-98",
        "Air Blade", "bikeApprove.png");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarTitle(
          title: "Tìm xe",
          func: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
        builder: (context, napshot) {
          if (napshot.connectionState == ConnectionState.done) {
            if (napshot.hasData) {
              ApproveModel? data = napshot.data as ApproveModel?;
              if (data != null) return BodyApprove(info: data);
            }
          }
          return BodyWaiting();
        },
        future: ownerAccepted(),
      ),
      bottomNavigationBar: BottomAppBar(
        color: ColorConstants.background,
        child: BottomBar(selected: "home"),
      ),
    );
  }
}
