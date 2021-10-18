import 'dart:convert';

import 'package:chothuexemay_mobile/apis/common.dart';
import 'package:chothuexemay_mobile/models/motor_type_model.dart';

import 'package:http/http.dart' as http;

class MotorTypeService {
  Future<List<MotorType>> getAll() async {
    Uri url = Uri.parse(MotorTypeApiPath.GET_ALL);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable types = body;
      return types.map((o) => MotorType.jsonFrom(o)).toList();
    } else {
      throw Exception("Unable to perform request");
    }
  }
}
