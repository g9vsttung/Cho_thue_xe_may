// ignore_for_file: file_names

import 'dart:convert';
import 'package:chothuexemay_mobile/apis/common.dart';
import 'package:chothuexemay_mobile/models/owner_model.dart';
import 'package:http/http.dart' as http;

class OwnerService {
  Future<List<Owner>> getAll() async {
    Uri url = Uri.parse(OwnerApiPath.GET_ALL);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable owners = body["data"];
      return owners.map((o) => Owner.jsonFrom(o)).toList();
    } else {
      throw Exception("Unable to perform request");
    }
  }

  Future<Owner> getOwnerById(String id) async {
    Uri url = Uri.parse(OwnerApiPath.GET_BY_ID + id);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return Owner.jsonFrom(body);
    } else {
      throw Exception("Unable to perform request");
    }
  }
}
