// ignore_for_file: avoid_function_literals_in_foreach_call

import 'package:chothuexemay_mobile/Repositories/Implementations/area_repository.dart';
import 'package:chothuexemay_mobile/Repositories/Implementations/booking_repository.dart';
import 'package:chothuexemay_mobile/Repositories/Implementations/customer_repository.dart';
import 'package:chothuexemay_mobile/models/customer_model.dart';
import 'package:chothuexemay_mobile/models/owner_model.dart';
import 'package:flutter/cupertino.dart';

class CustomerViewModel extends ChangeNotifier {
  final List<Customer> customers = [];
  String cityName = "";
  String address = "";
  String areaId = "";
  //optional
  // String dateRent = "";
  // String dateReturn = "";

  final CustomerRepository customerRepository = CustomerRepository();
  final AreaRepository _areaRepository = AreaRepository();
  final BookingRepository _bookingRepository = BookingRepository();
  void getAll() async {
    customers.clear();
    await customerRepository.getAll().then((value) => value.forEach((element) {
          customers.add(element);
        }));
    notifyListeners();
  }

  void storingLocation() {
    customerRepository.storingLocation();
  }

  void getData() async {
    cityName = await customerRepository.getCityName();
    address = await customerRepository.getAddress();
    areaId = await _areaRepository.findIdByName(cityName);
  }

  void findBikes(String typeId, String dateRent, String dateReturn) async {
    //Notification.
    List<Owner> list = await customerRepository.findBikes(areaId, typeId);
    dateRent = _convertDate(dateRent);
    dateReturn = _convertDate(dateReturn);
    _bookingRepository.booking(
        list[0].bike, '', dateRent, dateReturn, typeId, '');
  }

  //not use
  void booking(String dateRent, String dateReturn) {
    dateRent = _convertDate(dateRent);
    dateReturn = _convertDate(dateReturn);
  }

  String _convertDate(String date) {
    List<String> parts = date.split('/');
    String day = parts[0];
    String month = parts[1];
    String year = parts[2];
    return year + '-' + month + '-' + day;
  }
}
