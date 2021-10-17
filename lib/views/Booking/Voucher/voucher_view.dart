import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/views/Booking/Voucher/components/body.dart';
import 'package:chothuexemay_mobile/views/Components/app_bar.dart';
import 'package:flutter/material.dart';

class VoucherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarTitle(
          title: "Ưu đãi của bạn",
          func: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BodyVoucher(),
    );
  }
}