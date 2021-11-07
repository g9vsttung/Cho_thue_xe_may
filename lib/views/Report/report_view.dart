// ignore_for_file: must_be_immutable

import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/views/Components/app_bar.dart';
import 'package:chothuexemay_mobile/views/Report/components/body.dart';
import 'package:flutter/material.dart';

class ReportView extends StatelessWidget {
  String bookingId;

  ReportView({Key? key, required this.bookingId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorConstants.background,
          title: TopAppBarTitle(
            title: "Báo cáo",
          ),
        ),
        body: BodyReport(
          id: bookingId,
        ));
  }
}
