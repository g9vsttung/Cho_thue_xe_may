import 'package:chothuexemay_mobile/Repositories/generic_repository.dart';
import 'package:chothuexemay_mobile/models/bike_model.dart';
import 'package:chothuexemay_mobile/models/booking_success_model.dart';

abstract class IBookingRepository extends GenericRepository {
  Future<BookingSuccessModel> booking(Bike bike, String voucherCode,
      String dateRent, String dateReturn, String typeId, String paymentId);
}
