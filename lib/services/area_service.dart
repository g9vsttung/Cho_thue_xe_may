import 'dart:convert';

import 'package:chothuexemay_mobile/apis/common.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AreaService {
  Future<String> getIdByName(String cityName) async {
    Uri url = Uri.parse(AreaApiPath.GET_ALL + '?Name=' + cityName);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      String cityId = body[0]['id'];
      final SharedPreferences _preference =
          await SharedPreferences.getInstance();
      _preference.setString(GlobalDataConstants.AREAID, cityId);
      return cityId;
    } else {
      throw Exception("Unable to perform request");
    }
  }
}
