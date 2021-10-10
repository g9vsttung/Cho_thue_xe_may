import 'dart:convert';
import 'dart:developer';
import 'package:chothuexemay_mobile/apis/common.dart';
import 'package:chothuexemay_mobile/models/customer_model.dart';
import 'package:http/http.dart' as http;

class CustomerService {
  Future<Customer> getCustomerByPhone(String phone) async {
    Uri url = Uri.parse(CustomerApiPath.GET_BY_PHONE + phone);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return Customer.jsonFrom(body);
    } else {
      throw Exception("Unable to perform request");
    }
  }

  Future<List<Customer>> getAll() async {
    Uri url = Uri.parse(URL_SERVER + "api/areas");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable customers = body;
      return customers.map((uni) => Customer.jsonFrom(uni)).toList();
    } else {
      throw Exception("Unable to perform request");
    }
  }

  Future<bool> login(String phone) async {
    Uri url = Uri.parse(CustomerApiPath.LOGIN);
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json ; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'phoneNumber': phone}),
    );
    log("Login Status: " + response.statusCode.toString());
    return response.statusCode == 200;
  }
}
