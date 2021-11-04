import 'package:chothuexemay_mobile/models/booking_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/views/AppointmentDetail/components/body.dart';
import 'package:chothuexemay_mobile/views/Components/app_bar.dart';
import 'package:chothuexemay_mobile/views/Components/botton_app_bar.dart';
import 'package:flutter/material.dart';

class AppointmentDetailView extends StatelessWidget {
  Booking booking;

  AppointmentDetailView({required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarTitle(
          title: "Thông tin đơn",
          func: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BodyAppointmentDetail(booking: booking),
      bottomNavigationBar: BottomAppBar(
        color: ColorConstants.background,
        child: BottomBar(selected: "schedule"),
      ),
    );
  }
}
