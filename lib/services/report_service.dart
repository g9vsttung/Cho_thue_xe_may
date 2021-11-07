import 'dart:convert';

import 'package:chothuexemay_mobile/apis/common.dart';
import 'package:chothuexemay_mobile/models/report_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ReportService {
  Future<bool> submitReport(Report report) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.put(Uri.parse(ReportApiPath.SUBMIT_REPORT),
        headers: <String, String>{
          'Content-Type': 'application/json ; charset=UTF-8',
          'Authorization':
              'Bearer ' + prefs.getString(GlobalDataConstants.TOKEN).toString()
        },
        body: jsonEncode({"id": report.id, "content": report.content}));
    return response.statusCode == 200;
  }

  Future<Report> getReport(String id) async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();
    Uri url = Uri.parse(MotorTypeApiPath.GET_ALL_BY_AREA +
        _pref.getString(GlobalDataConstants.AREAID).toString());
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return Report.jsonFrom(body);
    } else {
      throw Exception("Unable to perform request");
    }
  }
}
