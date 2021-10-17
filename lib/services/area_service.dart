import 'dart:convert';

import 'package:chothuexemay_mobile/apis/common.dart';
import 'package:http/http.dart' as http;

class AreaService {
  Future<String> getIdByName(String cityName) async {
    Uri url = Uri.parse(AreaApiPath.GET_ALL + '?Name=' + cityName);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return body[0]['id'];
    } else {
      throw Exception("Unable to perform request");
    }
  }
}
