// ignore: import_of_legacy_library_into_null_safe
import 'dart:convert';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class GeoLocatorCustom {
  static Future<LatLng?> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);

    return LatLng(position.latitude, position.longitude);
  }

  Future<String> getAddress() async {
    final _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    String yourAdress = "";

    var address = await Geocoder.local.findAddressesFromCoordinates(
        Coordinates(_position.latitude, _position.longitude));
    yourAdress = address.first.addressLine;

    return yourAdress;
  }

  Future<String> getCityName() async {
    final _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    String yourCityName = "";

    var address = await Geocoder.local.findAddressesFromCoordinates(
        Coordinates(_position.latitude, _position.longitude));
    yourCityName = address.first.adminArea.replaceAll('Thành phố ', '');

    return yourCityName;
  }

  Future<Map<String, String>> getCustomerLocation(String address) async {
    Map<String, String> rs = {};
    Uri url = Uri.parse(
        'https://rsapi.goong.io/geocode?address=$address&api_key=MkP5cLaGx6mRgulWqb7dSEkFPlZqLsCDNq1ZUku1');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      rs['customerLocation'] =
          body['results'][0]['geometry']['location']['lat'].toString() +
          ',' +
          body['results'][0]['geometry']['location']['lng'].toString() ;
      rs['city'] = body['results'][0]['address_components'][3]['long_name'];
    }

    return rs;
  }
}
