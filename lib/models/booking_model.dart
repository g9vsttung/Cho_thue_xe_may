import 'package:chothuexemay_mobile/models/bike_model.dart';

class Booking {
  String id;
  String? voucherCode;
  String ownerId;
  String bikeId;
  DateTime dateRent;
  DateTime dateReturnExpected;
  DateTime dateReturnActual;
  double price;
  String paymentId;
  int status;
  Bike bike;
  String address;
  String paymentMethod;

  Booking(
      {required this.id,
      required this.ownerId,
      required this.bikeId,
      required this.dateRent,
      required this.dateReturnExpected,
      required this.dateReturnActual,
      required this.price,
      required this.paymentId,
      required this.status,
      required this.bike,
      required this.paymentMethod,
      required this.address,
      String? voucherCode}) {
    if (voucherCode != null) {
      this.voucherCode = voucherCode;
    }
  }
}
