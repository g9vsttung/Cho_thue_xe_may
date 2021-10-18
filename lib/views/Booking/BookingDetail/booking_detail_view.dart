import 'package:chothuexemay_mobile/models/price_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/views/Booking/BookingDetail/components/body.dart';
import 'package:chothuexemay_mobile/views/Components/app_bar.dart';
import 'package:chothuexemay_mobile/views/Components/botton_app_bar.dart';
import 'package:chothuexemay_mobile/views/Home/home_view.dart';
import 'package:flutter/material.dart';

class BookingDetailView extends StatelessWidget {
  String dateRent;
  String dateReturn;
  PriceDataTable cateBike;

  BookingDetailView(
      {required this.dateRent,
      required this.dateReturn,
      required this.cateBike});

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
      body: BodyBookingDetail(
        dateRent: dateRent,
        dateReturn: dateReturn,
        cateBike: cateBike,
      ),
      bottomNavigationBar: BottomAppBar(
        color: ColorConstants.background,
        child: BottomBar(selected: "home"),
      ),
    );
  }
}
