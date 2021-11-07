import 'dart:convert';

import 'package:chothuexemay_mobile/apis/common.dart';
import 'package:chothuexemay_mobile/models/booking_transaction.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BookingService {
  Future<List<BookingTranstion>> getBookingTransactions() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    Uri url = Uri.parse(BookingApiPath.GET_ALL_TRANSACTIONS);
    final headers = {
      'Content-Type': 'application/json ; charset=UTF-8',
      'Authorization':
          'Bearer ' + _prefs.getString(GlobalDataConstants.TOKEN).toString()
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final Iterable transactions = jsonDecode(response.body);
      return transactions.map((e) => BookingTranstion.jsonFrom(e)).toList();
    } else {
      throw Exception("Unable to perform request");
    }
  }

  Future<BookingTranstion> getById(String id) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    Uri url = Uri.parse(BookingApiPath.GET_BY_ID + id);
    final headers = {
      'Content-Type': 'application/json ; charset=UTF-8',
      'Authorization':
          'Bearer ' + _prefs.getString(GlobalDataConstants.TOKEN).toString()
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return BookingTranstion.jsonFrom(body);
    } else {
      throw Exception("Unable to perform request");
    }
  }

  Future<List<BookingTranstion>> getOngoingBookingTransactions(
      int page, int size) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    Uri url = Uri.parse(BookingApiPath.GET_ALL_TRANSACTIONS +
        '?status=0&size=$size&pageNum=$page');
    final headers = {
      'Content-Type': 'application/json ; charset=UTF-8',
      'Authorization':
          'Bearer ' + _prefs.getString(GlobalDataConstants.TOKEN).toString()
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable transactions = body['data'];
      return transactions.map((e) => BookingTranstion.jsonFrom(e)).toList();
    } else if (response.statusCode == 404) {
      return [];
    } else {
      throw Exception("Unable to perform request");
    }
  }

  Future<List<BookingTranstion>> getHistoryBookingTransactions(
      int page, int size) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    Uri url = Uri.parse(BookingApiPath.GET_ALL_TRANSACTIONS +
        '?status=1&size=$size&pageNum=$page');
    final headers = {
      'Content-Type': 'application/json ; charset=UTF-8',
      'Authorization':
          'Bearer ' + _prefs.getString(GlobalDataConstants.TOKEN).toString()
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable transactions = body['data'];
      return transactions.map((e) => BookingTranstion.jsonFrom(e)).toList();
    } else if (response.statusCode == 404) {
      return [];
    } else {
      throw Exception("Unable to perform request");
    }
  }
}
