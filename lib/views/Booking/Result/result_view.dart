// ignore_for_file: must_be_immutable

import 'package:chothuexemay_mobile/models/owner_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/views/Booking/Result/components/body_approve.dart';
import 'package:chothuexemay_mobile/views/Booking/Result/components/body_not_found.dart';
import 'package:chothuexemay_mobile/views/Components/app_bar.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  Owner? owner;

  ResultView({Key? key, Owner? owner}) : super(key: key) {
    if (owner != null) {
      this.owner = owner;
    }
  }

  Widget getBody() {
    if (owner != null) {
      return BodyApprove(owner: owner!);
    } else {
      return BodyNotFound();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarTitle(
          title: "Tìm xe",
          hasBack: false,
        ),
      ),
      body: getBody(),
    );
  }
}
