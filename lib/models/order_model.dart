import 'package:chothuexemay_mobile/models/motor_type_model.dart';

class OrderModel {
  DateTime dateRent;
  DateTime dateReturn;
  MotorType? cateBike;
  String? rentMethod;
  String address;
  String? areaId;
  double? totalPrice;
  String? customerLocation;
  String? typeId;

  //noti
  String? imgPath;
  String? cateName;
  String? licensePlate;
  String? ownerId;
  String? bikeId;
  String? categoryId;
  String? voucherCode;
  OrderModel(
      {required this.dateRent,
      required this.dateReturn,
      required this.cateBike,
      required this.rentMethod,
      required this.address});

  OrderModel.findBy(
      {required this.typeId,
      required this.dateRent,
      required this.dateReturn,
      required this.totalPrice,
      required this.address,
      required this.voucherCode});

  OrderModel.sendNoti(
      {required this.ownerId,
      required this.licensePlate,
      required this.cateName,
      required this.dateRent,
      required this.dateReturn,
      required this.imgPath,
      required this.address,
      required this.totalPrice});

  OrderModel.createBooking(
      {required this.ownerId,
      required this.licensePlate,
      required this.cateName,
      required this.dateRent,
      required this.dateReturn,
      required this.imgPath,
      required this.typeId,
      required this.address,
      required this.totalPrice,
      required this.bikeId,
      required this.categoryId,
      required this.voucherCode});
}
