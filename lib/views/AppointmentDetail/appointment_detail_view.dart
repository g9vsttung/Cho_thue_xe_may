// ignore_for_file: must_be_immutable

import 'package:chothuexemay_mobile/models/booking_transaction.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/view_model/booking_view_model.dart';
import 'package:chothuexemay_mobile/views/AppointmentDetail/components/body.dart';
import 'package:chothuexemay_mobile/views/Components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentDetailView extends StatelessWidget {
  String bookingId;

  AppointmentDetailView({Key? key, required this.bookingId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarTitle(
          title: "Thông tin đơn",
        ),
      ),
      body: FutureBuilder(
        builder: (context, napshot) {
          if (napshot.connectionState == ConnectionState.done) {
            if (napshot.hasData) {
              final booking =
                  (napshot.data as dynamic)['booking'] as BookingTranstion;

              return BodyAppointmentDetail(booking: booking);
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        future: getData(context),
      ),
    );
  }

  Future<Map<String, dynamic>> getData(BuildContext context) async {
    Map<String, dynamic> list = {};
    list['booking'] =
        await Provider.of<BookingTransactionViewModel>(context, listen: false)
            .getById(bookingId);
    return list;
  }
}
