import 'dart:convert';

import 'package:chothuexemay_mobile/apis/common.dart';
import 'package:chothuexemay_mobile/models/bike_model.dart';
import 'package:chothuexemay_mobile/models/booking_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BookingService {
  // Future<BookingModel> bookingBike(
  //     Bike bike,
  //     String voucherCode,
  //     String dateRent,
  //     String dateReturn,
  //     String typeId,
  //     String paymentId) async {
  //   String optionalVoucher = "";
  //
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final response = await http.post(Uri.parse(BookingApiPath.BOOKING_BIKE),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json ; charset=UTF-8',
  //         'Authorization':
  //             'Bearer ' + prefs.getString(GlobalDataConstants.TOKEN).toString()
  //       },
  //       body: jsonEncode(<String, String>{
  //         'ownerId': bike.ownerId,
  //         'bikeId': bike.id,
  //         'categoryId': bike.categoryId,
  //         'typeId': typeId,
  //         'paymentId': 'b04c2ac3-851e-4620-be02-687f12fa6c29',
  //         'dayRent': dateRent,
  //         'dayReturnExpected': dateReturn,
  //       }));
  //   if (response.statusCode == 200) {
  //     final data = response.body;
  //   }
  //   return BookingModel();
  // }
}
