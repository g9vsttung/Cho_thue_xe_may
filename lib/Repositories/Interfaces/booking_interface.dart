import 'package:chothuexemay_mobile/Repositories/generic_repository.dart';
import 'package:chothuexemay_mobile/models/bike_model.dart';
import 'package:chothuexemay_mobile/models/booking_model.dart';
import 'package:chothuexemay_mobile/models/booking_transaction.dart';

abstract class IBookingRepository extends GenericRepository {
  Future<List<BookingTranstion>> getBookingTransactions();
  Future<BookingTranstion> getBookingTransactionById(String id);
}
