import 'package:chothuexemay_mobile/models/booking_transaction.dart';
import 'package:chothuexemay_mobile/models/category_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/view_model/booking_view_model.dart';
import 'package:chothuexemay_mobile/view_model/category_view_model.dart';
import 'package:chothuexemay_mobile/views/Appointment/components/body.dart';
import 'package:chothuexemay_mobile/views/Components/app_bar.dart';
import 'package:chothuexemay_mobile/views/Components/botton_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarTitle(title: "Đơn đặt", hasBack: false),
      ),
      body: FutureBuilder(
        builder: (context, napshot) {
          if (napshot.connectionState == ConnectionState.done) {
            if (napshot.hasData) {
              final bookingHistory = (napshot.data as dynamic)['bookingHistory']
                  as List<BookingTranstion>;
              final bookingOngoing = (napshot.data as dynamic)['bookingOngoing']
                  as List<BookingTranstion>;
              final categories =
                  (napshot.data as dynamic)['categories'] as List<Category>;
              return BodyAppointment(
                bookingHistory: bookingHistory,
                bookingOngoing: bookingOngoing,
                categories: categories,
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        future: getData(context),
      ),
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomAppBar(
        color: ColorConstants.background,
        child: BottomBar(selected: "schedule"),
      ),
    );
  }

  Future<Map<String, dynamic>> getData(BuildContext context) async {
    Map<String, dynamic> list = {};
    list['bookingHistory'] =
        await Provider.of<BookingTransactionViewModel>(context, listen: false)
            .getHistoryBookingTransactions(1);
    list['bookingOngoing'] =
        await Provider.of<BookingTransactionViewModel>(context, listen: false)
            .getOngoingBookingTransactions(1);
    list['categories'] =
        await Provider.of<CategoryViewModel>(context, listen: false).getAll();
    return list;
  }
}
