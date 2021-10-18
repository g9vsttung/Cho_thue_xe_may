// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:convert';
import 'dart:developer';

import 'package:chothuexemay_mobile/services/geolocation_service.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseDatabaseCustom {
  DatabaseReference database = FirebaseDatabase(
    app: Firebase.app(),
    databaseURL:
        'https://chothuexemay-35838-default-rtdb.asia-southeast1.firebasedatabase.app',
  ).reference();

  String userId = "";

  final String _pathOwnerLocation = 'locations/owners/';
  final String _pathCustomerLocation = 'locations/customers/';
  final String _latitudeChild = "latitude";
  final String _longitudeChild = "longitude";

  Future _checkExist() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString(GlobalDataConstants.USERID)!;
    DataSnapshot snapshot =
        await database.child(_pathOwnerLocation + userId).once();
    return snapshot.value != null;
  }

  //Đặt bên customer và getOwnerLocation
  Future<Map<String, LatLng>> getCustomerLocation() async {
    Map<String, LatLng> listResult = {};
    DataSnapshot snapshot = await database.child(_pathCustomerLocation).once();
    if (snapshot.value != null) {
      snapshot.value.forEach((k, v) =>
          {listResult['${k}'] = LatLng(v['latitude'], v['longitude'])});
    }
    return listResult;
  }

  Future<void> storingLocationRealtime() async {
    final _latlng = await GeoLocatorCustom.determinePosition();
    if (await _checkExist()) {
      _updateLocation(_latlng!);
    } else {
      _writeLocation(_latlng!);
    }
  }

  void _writeLocation(LatLng latLng) {
    database
        .child(_pathCustomerLocation + userId)
        .set({
          _latitudeChild: latLng.latitude,
          _longitudeChild: latLng.longitude
        })
        .then((value) => log("Location updated!"))
        .catchError((error) => {log(error.toString())});
  }

  void _updateLocation(LatLng latLng) {
    database
        .child(_pathCustomerLocation + userId)
        .update({
          _latitudeChild: latLng.latitude,
          _longitudeChild: latLng.longitude
        })
        .then((value) => log("Update store location to FirebaseDB"))
        .catchError((error) => {log(error.toString())});
  }

  void distanceCalculator(String start, String ends) async {
    //This list store distance from the start point to the destination pointS by meters.
    List<int> distanceList = [];
    const String _key = 'MkP5cLaGx6mRgulWqb7dSEkFPlZqLsCDNq1ZUku1';

    Uri url = Uri.parse(
        'https://rsapi.goong.io/DistanceMatrix?origins=${start}&destinations=${ends}&vehicle=bike&api_key=${_key}');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final result = body['rows'][0]['elements'];
      result.forEach((r) => {
            if (r['status'] == 'OK') {distanceList.add(r['distance']['value'])}
          });
    } else {
      throw Exception("Unable to perform request");
    }
  }
}
