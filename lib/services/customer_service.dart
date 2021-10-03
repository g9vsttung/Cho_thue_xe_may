import 'dart:convert';
import 'package:chothuexemay_mobile/models/customer_model.dart';
import 'package:http/http.dart' as http;

class CustomerService {
  Future<Customer> getCustomerByPhone(String phone) async {
    Uri url = Uri.parse("http://54.179.97.82/" + "api/admin/phone/");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return Customer.jsonFrom(body);
    } else {
      throw Exception("Unable to perform request");
    }
  }

  Future<List<Customer>> getAll() async {
    Uri url = Uri.parse("http://54.179.97.82/" + "api/areas");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable customers = body;
      return customers.map((uni) => Customer.jsonFrom(uni)).toList();
    } else {
      throw Exception("Unable to perform request");
    }
  }
}
