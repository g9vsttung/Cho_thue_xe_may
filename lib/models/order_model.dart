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
  OrderModel(
      {required this.dateRent,
      required this.dateReturn,
      required this.cateBike,
      required this.rentMethod,
      required this.address});
  OrderModel.findBy({
    required this.typeId,
    required this.dateRent,
    required this.dateReturn,
    required this.totalPrice,
    required this.address,
  });
}
