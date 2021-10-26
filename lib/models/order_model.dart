import 'package:chothuexemay_mobile/models/price_model.dart';
import 'package:flutter/material.dart';

class OrderModel {
  DateTime dateRent;
  DateTime dateReturn;
  PriceDataTable cateBike;
  String rentMethod;
  String address;

  OrderModel(
      {required this.dateRent,
      required this.dateReturn,
      required this.cateBike,
      required this.rentMethod,
      required this.address});
}
