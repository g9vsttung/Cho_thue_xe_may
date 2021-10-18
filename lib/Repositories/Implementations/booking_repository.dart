import 'package:chothuexemay_mobile/Repositories/Interfaces/booking_interface.dart';
import 'package:chothuexemay_mobile/models/bike_model.dart';
import 'package:chothuexemay_mobile/models/booking_success_model.dart';
import 'package:chothuexemay_mobile/services/booking_service.dart';

class BookingRepository implements IBookingRepository {
  final BookingService _bookingService = BookingService();
  @override
  Future<void> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<BookingSuccessModel> booking(
      Bike bike,
      String voucherCode,
      String dateRent,
      String dateReturn,
      String typeId,
      String paymentId) async {
    return await _bookingService.bookingBike(
        bike, voucherCode, dateRent, dateReturn, typeId, paymentId);
  }
}
