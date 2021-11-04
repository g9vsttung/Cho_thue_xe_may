import 'dart:convert';

import 'package:chothuexemay_mobile/apis/common.dart';
import 'package:chothuexemay_mobile/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  Future<List<Category>> getAll() async {
    Uri url = Uri.parse(CategoryApiPath.GET_ALL);
    final headers = {
      'Content-Type': 'application/json ; charset=UTF-8',
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable categories = body['data'];
      return categories.map((e) => Category.jsonFrom(e)).toList();
    } else {
      throw Exception("Unable to perform request");
    }
  }
}
