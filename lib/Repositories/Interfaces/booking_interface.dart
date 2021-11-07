import 'package:chothuexemay_mobile/Repositories/generic_repository.dart';
import 'package:chothuexemay_mobile/models/booking_transaction.dart';

abstract class IBookingRepository extends GenericRepository {
  Future<List<BookingTranstion>> getBookingTransactions();
  Future<List<BookingTranstion>> getOngoingBookingTransactions(
      int page, int size);
  Future<List<BookingTranstion>> getHistoryBookingTransactions(
      int page, int size);
  Future<BookingTranstion> getBookingTransactionById(String id);
}
