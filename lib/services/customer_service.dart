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
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerService {
  final _geoLocationServive = GeoLocatorCustom();
  final _firebaseRealtimeService = FirebaseDatabaseCustom();
  final _areaService = AreaService();
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
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

  Future<int> login(String phone) async {
    Uri url = Uri.parse(CustomerApiPath.LOGIN);
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json ; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'phoneNumber': phone}),
    );
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final SharedPreferences _preference =
          await SharedPreferences.getInstance();
      String fullName = body['fullName'];
      await _preference.setString(GlobalDataConstants.USER_NAME, fullName);
      String token = body['token'];
      await _preference.setString(GlobalDataConstants.TOKEN, token);
      Map<String, dynamic> payload = Jwt.parseJwt(token);
      await _preference.setString(GlobalDataConstants.USERID, payload["id"]);
      log(_preference.getString(GlobalDataConstants.USERID).toString());
      //Location
      _firebaseRealtimeService.storingLocationRealtime();
      _fcm.getToken().then((token) {
        _firebaseRealtimeService.updateTokenFCM(token!);
      });
    }
    return response.statusCode;
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
        '?areaId=$areaId&dateRent=$dateRent&dateReturn=$dateReturn&totalPrice=${model.totalPrice}&address=${model.address}&customerLocation=$customerLocation&typeId=${model.typeId}');
    final headers = {
      'Content-Type': 'application/json ; charset=UTF-8',
      'Authorization':
          'Bearer ' + prefs.getString(GlobalDataConstants.TOKEN).toString()
    };
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      log('Found bikes');
      final Iterable owners = body;
      log(body);
      return owners.map((o) => Owner.jsonFrom(o)).toList();
    } else if (response.statusCode == 404) {
      log('Cannot found any bike');
      return [];
    } else {
      throw Exception("Unable to perform request");
    }
  }

  Future<void> sendNoti(OrderModel order) async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();
    String? userId = _pref.getString(GlobalDataConstants.USERID);
    String? cusName = _pref.getString(GlobalDataConstants.USER_NAME);
    Uri url = Uri.parse("http://18.138.110.46/api/v2/owners/testSendNoti?"
        "ownerId=${order.ownerId}&CustomerId=$userId&CustomerName=$cusName&LicensePlate=${order.licensePlate}&CateName=${order.cateName}&DateRent=${order.dateRent}&DateReturn=${order.dateReturn}&ImgPath=${order.imgPath}&Address=${order.address}&Price=${order.totalPrice}");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      log('Sending notification successfully!');
    } else {
      log('Sending notification failed!');
    }
  }

  Future<void> createBooking(OrderModel order) async {
    String dateRent =
        order.dateRent.toString().substring(0, 16).replaceAll(' ', 'T');
    String dateReturn =
        order.dateReturn.toString().substring(0, 16).replaceAll(' ', 'T');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final body = jsonEncode(<String, String>{
      "ownerId": order.ownerId!,
      "bikeId": order.bikeId!,
      "categoryId": order.categoryId!,
      "typeId": order.typeId!,
      "paymentId": "0a8f83ec-ef70-48c1-a793-a367191ad1b3",
      "strVoucherCode": order.voucherCode ?? '',
      "price": order.totalPrice!.toString(),
      "dayRent": dateRent,
      "dayReturnExpected": dateReturn,
      "address": order.address
    });
    final response = await http.post(Uri.parse(BookingApiPath.BOOKING_BIKE),
        headers: <String, String>{
          'Content-Type': 'application/json ; charset=UTF-8',
          'Authorization':
              'Bearer ' + prefs.getString(GlobalDataConstants.TOKEN).toString()
        },
        body: body);

    log('Created booking successfully: ' + response.statusCode.toString());
  }

  Future<int> getRewardPoint() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString(GlobalDataConstants.USERID);
    Uri url = Uri.parse(CustomerApiPath.VIEW_PROFILE + userId.toString());
    final headers = {
      'Content-Type': 'application/json ; charset=UTF-8',
    };
    final response = await http.get(url, headers: headers);
    return jsonDecode(response.body)['rewardPoints'] as int;
  }

  Future<Customer> viewProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString(GlobalDataConstants.USERID);
    Uri url = Uri.parse(CustomerApiPath.VIEW_PROFILE + userId.toString());
    final headers = {
      'Content-Type': 'application/json ; charset=UTF-8',
    };
    final response = await http.get(url, headers: headers);

    return Customer.jsonFrom(jsonDecode(response.body));
  }

  Future<bool> updateProfile(String name, String phone) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.put(Uri.parse(CustomerApiPath.VIEW_PROFILE),
        headers: <String, String>{
          'Content-Type': 'application/json ; charset=UTF-8',
          'Authorization':
              'Bearer ' + prefs.getString(GlobalDataConstants.TOKEN).toString()
        },
        body: jsonEncode({
          "id": prefs.getString(GlobalDataConstants.USERID).toString(),
          "phoneNumber": phone,
          "fullname": name,
        }));

    return response.statusCode == 200;
  }

  Future<bool> register(String phone) async {
    final response = await http.post(Uri.parse(CustomerApiPath.REGISTRATION),
        headers: <String, String>{
          'Content-Type': 'application/json ; charset=UTF-8',
        },
        body: jsonEncode({
          "phoneNumber": phone,
        }));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final SharedPreferences _preference =
          await SharedPreferences.getInstance();
      String fullName = body['fullName'];
      await _preference.setString(GlobalDataConstants.USER_NAME, fullName);
      String token = body['token'];
      await _preference.setString(GlobalDataConstants.TOKEN, token);
      Map<String, dynamic> payload = Jwt.parseJwt(token);
      await _preference.setString(GlobalDataConstants.USERID, payload["id"]);
      log(_preference.getString(GlobalDataConstants.USERID).toString());
      //Location
      _firebaseRealtimeService.storingLocationRealtime();
      _fcm.getToken().then((token) {
        _firebaseRealtimeService.updateTokenFCM(token!);
      });
    }
    return response.statusCode == 200;
  }
}
