import 'package:chothuexemay_mobile/models/bike_model.dart';
import 'package:chothuexemay_mobile/models/feedback_model.dart';

class BookingTranstion {
  String id;
  String voucherCode;
  String customerId;
  String ownerId;
  Bike bike;
  String dateRentActual;
  String dateReturnActual;
  double price;
  String paymentId;
  int status;
  String address;
  String? ownerPhone;
  FeedbackModel? feedback;
  String? paymentName;
  BookingTranstion(
      {required this.bike,
      required this.customerId,
      required this.dateRentActual,
      required this.dateReturnActual,
      required this.id,
      required this.ownerId,
      required this.paymentId,
      required this.price,
      required this.status,
      required this.voucherCode,
      required this.address});

  factory BookingTranstion.jsonFrom(Map<String, dynamic> json) {
    return BookingTranstion(
        bike: Bike.jsonFrom(json['bike']),
        customerId: json['customerId'],
        dateRentActual: json['dayRent'],
        dateReturnActual: json['dayReturnExpected'],
        id: json['id'] ?? "",
        ownerId: json['ownerId'] ?? "",
        paymentId: json['paymentId'] ?? "",
        price: json['price'].toDouble() ?? 0,
        status: json['status'] == null ? 0 : json['status'].toInt(),
        voucherCode: json['voucherCode'] ?? "",
        address: json['address'] ?? "Unknow");
  }
}
