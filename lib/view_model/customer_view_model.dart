// ignore_for_file: avoid_function_literals_in_foreach_call

import 'package:chothuexemay_mobile/Repositories/Implementations/area_repository.dart';
import 'package:chothuexemay_mobile/Repositories/Implementations/booking_repository.dart';
import 'package:chothuexemay_mobile/Repositories/Implementations/customer_repository.dart';
import 'package:chothuexemay_mobile/models/approve_model.dart';
import 'package:chothuexemay_mobile/models/customer_model.dart';
import 'package:chothuexemay_mobile/models/order_model.dart';
import 'package:chothuexemay_mobile/models/owner_model.dart';
import 'package:chothuexemay_mobile/views/Home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  Future getData() async {
    cityName = await customerRepository.getCityName();
    address = await customerRepository.getAddress();
    areaId = await _areaRepository.findIdByName(cityName);
  }

  findBikes(OrderModel model, BuildContext context) async {
    List<Owner> list = await customerRepository.findBikes(model);
    if (list.length == 0) {
      //No bikes
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return const HomeView(); //=> Return Not FOUND ANY PAGE
        },
      ));
    }
    //Having nearby bikes
    for (Owner o in list) {
      //waiting for owner response

      //if no one accept => Return Not FOUND ANY PAGE

      //if have => Return BookingSuccess object for displaying information in BookingDetails/body
    }
  }
}
