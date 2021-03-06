// ignore_for_file: must_be_immutable

import 'package:chothuexemay_mobile/models/order_model.dart';
import 'package:chothuexemay_mobile/models/voucher_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/view_model/customer_view_model.dart';
import 'package:chothuexemay_mobile/view_model/voucher_view_model.dart';
import 'package:chothuexemay_mobile/views/Booking/BookingDetail/booking_detail_view.dart';
import 'package:chothuexemay_mobile/views/Booking/Voucher/components/body.dart';
import 'package:chothuexemay_mobile/views/Components/app_bar.dart';
import 'package:chothuexemay_mobile/views/Profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VoucherView extends StatelessWidget {
  OrderModel? order;
  String? selectedTab;
  bool hasAction = true;

  VoucherView(
      {Key? key, String? selectedTab, bool? hasAction, OrderModel? order})
      : super(key: key) {
    if (selectedTab != null) {
      this.selectedTab = selectedTab;
    }
    if (hasAction != null) {
      this.hasAction = hasAction;
    }
    if (order != null) {
      this.order = order;
    }
  }

  Future<Map<String, dynamic>> getData(BuildContext context) async {
    Map<String, dynamic> list = {};
    await Provider.of<VoucherViewModel>(context, listen: false).getAll();
    list['vouchersAvailable'] =
        Provider.of<VoucherViewModel>(context, listen: false).vouchers;
    list['vouchersExchange'] =
        await Provider.of<VoucherViewModel>(context, listen: false)
            .getVouchersToExchange();
    list['points'] =
        await Provider.of<CustomerViewModel>(context, listen: false)
            .getRewardPoints();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarTitle(
          title: "Ưu đãi của bạn",
          func: () {
            if (hasAction) {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return BookingDetailView(order: order!);
                },
              ));
            } else {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const ProfileView();
                },
              ));
            }
          },
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: FutureBuilder(
        builder: (context, napshot) {
          if (napshot.connectionState == ConnectionState.done) {
            if (napshot.hasData) {
              final List<Voucher> vouchers = (napshot.data
                  as dynamic)['vouchersAvailable'] as List<Voucher>;
              final List<Voucher> vouchersExchange = (napshot.data
                  as dynamic)['vouchersExchange'] as List<Voucher>;
              final rewardPoint = (napshot.data as dynamic)['points'] as int;
              return BodyVoucher(
                order: order,
                vouchersAvailable: vouchers,
                vouchersExchange: vouchersExchange,
                point: rewardPoint,
                selectedTab: selectedTab,
                hasAction: hasAction,
              );
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
}
