// ignore_for_file: avoid_function_literals_in_foreach_call

import 'package:chothuexemay_mobile/Repositories/Implementations/area_repository.dart';
import 'package:chothuexemay_mobile/Repositories/Implementations/booking_repository.dart';
import 'package:chothuexemay_mobile/Repositories/Implementations/customer_repository.dart';
import 'package:chothuexemay_mobile/Repositories/Interfaces/area_interface.dart';
import 'package:chothuexemay_mobile/Repositories/Interfaces/booking_interface.dart';
import 'package:chothuexemay_mobile/Repositories/Interfaces/customer_interface.dart';
import 'package:chothuexemay_mobile/models/booking_transaction.dart';
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

  final ICustomerRepository customerRepository = CustomerRepository();
  final IAreaRepository _areaRepository = AreaRepository();
  final IBookingRepository _bookingRepository = BookingRepository();
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

  Future<List<Owner>> findBikes(OrderModel model, BuildContext context) async {
    List<Owner> list = await customerRepository.findBikes(model);
    if (list.length == 0) {
      //No bikes
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return const HomeView(); //=> Return Not FOUND ANY PAGE
        },
      ));
    }
    return list;
  }

  Future<void> sendNoti(OrderModel order) async {
    customerRepository.sendNoti(order);
  }

  Future<void> createBooking(OrderModel order) async {
    customerRepository.createBooking(order);
  }

  Future<int> getRewardPoints() async {
    return await customerRepository.getRewardPoints();
  }

  Future<Customer> viewProfile() async {
    return await customerRepository.viewProfile();
  }

  Future<List<BookingTranstion>> getBookingTransactions() async {
    return await _bookingRepository.getBookingTransactions();
  }
  Future<bool> updateProfile(String name,String phone) async {
    return await customerRepository.updateProfile(name, phone);
  }
}
