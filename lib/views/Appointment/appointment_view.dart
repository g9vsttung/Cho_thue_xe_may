import 'package:chothuexemay_mobile/models/booking_transaction.dart';
import 'package:chothuexemay_mobile/models/category_model.dart';
import 'package:chothuexemay_mobile/models/owner_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/view_model/category_view_model.dart';
import 'package:chothuexemay_mobile/view_model/customer_view_model.dart';
import 'package:chothuexemay_mobile/view_model/owner_view_model.dart';
import 'package:chothuexemay_mobile/views/Appointment/components/body.dart';
import 'package:chothuexemay_mobile/views/Components/app_bar.dart';
import 'package:chothuexemay_mobile/views/Components/botton_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarTitle(
            title: "Đơn đặt",
            func: () {
              Navigator.pop(context);
            }),
      ),
      body: FutureBuilder(
        builder: (context, napshot) {
          if (napshot.connectionState == ConnectionState.done) {
            if (napshot.hasData) {
              final transactions = (napshot.data as dynamic)['transactions']
                  as List<BookingTranstion>;
              final categories =
                  (napshot.data as dynamic)['categories'] as List<Category>;
              return BodyAppointment(
                transactions: transactions,
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
    list['transactions'] =
        await Provider.of<CustomerViewModel>(context, listen: false)
            .getBookingTransactions();
    for (BookingTranstion booking in list['transactions']) {
      await Provider.of<OwnerViewModel>(context, listen: false)
          .getOwnerById(booking.ownerId);
      Owner o = Provider.of<OwnerViewModel>(context, listen: false).owner!;
      booking.bike.ownerName = o.fullname;
      booking.bike.ownerPhone = o.phoneNumber;
    }
    list['categories'] =
        await Provider.of<CategoryViewModel>(context, listen: false).getAll();
    return list;
  }
}
