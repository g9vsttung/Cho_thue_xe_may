import 'package:chothuexemay_mobile/models/order_model.dart';
import 'package:chothuexemay_mobile/models/voucher_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/views/Booking/BookingDetail/components/body.dart';
import 'package:chothuexemay_mobile/views/Components/app_bar.dart';
import 'package:chothuexemay_mobile/views/Components/botton_app_bar.dart';
import 'package:chothuexemay_mobile/views/Home/home_view.dart';
import 'package:flutter/material.dart';

class BookingDetailView extends StatelessWidget {
  OrderModel order;
  VoucherModel? voucher;

  BookingDetailView({required this.order, VoucherModel? voucher}) {
    if (voucher != null) {
      this.voucher = voucher;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarTitle(
            title: "Đặt xe",
            func: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return HomeView();
                },
              ));
            }),
      ),
      body: getBody(),
      bottomNavigationBar: BottomAppBar(
        color: ColorConstants.background,
        child: BottomBar(selected: "home"),
      ),
    );
  }

  Widget getBody() {
    if (voucher != null) {
      return BodyBookingDetail(
        order: order,
        voucher: voucher,
      );
    } else {
      return BodyBookingDetail(
        order: order,
      );
    }
  }
}
