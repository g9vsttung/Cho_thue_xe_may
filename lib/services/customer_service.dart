import 'dart:convert';
import 'dart:developer';
import 'package:chothuexemay_mobile/apis/common.dart';
import 'package:chothuexemay_mobile/models/customer_model.dart';
import 'package:chothuexemay_mobile/models/order_model.dart';
import 'package:chothuexemay_mobile/models/owner_model.dart';
import 'package:chothuexemay_mobile/services/area_service.dart';
import 'package:chothuexemay_mobile/services/firebase_database.dart';
import 'package:chothuexemay_mobile/services/geolocation_service.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerService {
  final _geoLocationServive = GeoLocatorCustom();
  final _firebaseRealtimeService = FirebaseDatabaseCustom();
  final _areaService = AreaService();
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
    if (response.statusCode == 200) {
      final SharedPreferences _preference =
          await SharedPreferences.getInstance();
      String token = response.body;
      await _preference.setString(GlobalDataConstants.TOKEN, token);
      Map<String, dynamic> payload = Jwt.parseJwt(token);
      await _preference.setString(GlobalDataConstants.USERID, payload["id"]);
      //Location
      _firebaseRealtimeService.storingLocationRealtime();
    }
    return response.statusCode == 200;
  }

  Future<List<Owner>> findBikes(OrderModel model) async {
    //findCustomerLocation
    Map<String, String> rs =
        await _geoLocationServive.getCustomerLocation(model.address);
    String customerLocation = rs['customerLocation'] as String;
    String city = rs['city'] as String;
    String areaId = await _areaService.getIdByName(city);

    //Parse dattime right format yyyy-mm-ddThh:mm
    String dateRent =
        model.dateRent.toString().substring(0, 16).replaceAll(' ', 'T');
    String dateReturn =
        model.dateReturn.toString().substring(0, 16).replaceAll(' ', 'T');

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Uri url = Uri.parse(BikeApiPath.FIND_BIKE +
        '?areaId=$areaId&dateRent=$dateRent&dateReturn=$dateReturn&totalPrice=${model.totalPrice}&address=${model.address}&customerLocation=$customerLocation');
    final headers = {
      'Content-Type': 'application/json ; charset=UTF-8',
      'Authorization':
          'Bearer ' + prefs.getString(GlobalDataConstants.TOKEN).toString()
    };
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      log('Found bikes');
      return [];
    } else if (response.statusCode == 404) {
      log('Cannot found any bike');
      return [];
    } else {
      throw Exception("Unable to perform request");
    }
  }
}
