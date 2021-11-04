import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:chothuexemay_mobile/apis/common.dart';
import 'package:chothuexemay_mobile/models/voucher_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VoucherService {
  Future<List<Voucher>> getAll() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    Uri url = Uri.parse(VoucherApiPath.GET_ALL +
        _preferences.getString(GlobalDataConstants.USERID).toString());
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Iterable vouchers = jsonDecode(response.body);
      return vouchers.map((e) => Voucher.jsonFrom(e)).toList();
    } else {
      throw Exception("Unable to perform request");
    }
  }

  Future<List<Voucher>> getVouchersToExchange() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();

    Uri url = Uri.parse(VoucherApiPath.GET_VOUCHERS_TO_EXCHANGE +
        _preferences.getString(GlobalDataConstants.AREAID).toString());
    final headers = {
      'Content-Type': 'application/json ; charset=UTF-8',
      'Authorization': 'Bearer ' +
          _preferences.getString(GlobalDataConstants.TOKEN).toString()
    };

    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final Iterable vouchers = jsonDecode(response.body);
      return vouchers.map((e) => Voucher.jsonFromExchange(e)).toList();
    } else {
      throw Exception("Unable to perform request");
    }
  }

  Future<bool> exchangePointToGetVoucher(String voucherId) async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();
    Uri url = Uri.parse(VoucherApiPath.EXCHANGE_POINTS_TO_GET_VOUCHER);
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json ; charset=UTF-8',
        'Authorization':
            'Bearer ' + _pref.getString(GlobalDataConstants.TOKEN).toString()
      },
      body: jsonEncode(<String, String>{
        "customerId": _pref.getString(GlobalDataConstants.USERID).toString(),
        "voucherId": voucherId
      }),
    );
    return response.statusCode == 200;
  }
}
