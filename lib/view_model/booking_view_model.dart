import 'package:chothuexemay_mobile/Repositories/Implementations/booking_repository.dart';
import 'package:chothuexemay_mobile/Repositories/Interfaces/booking_interface.dart';
import 'package:chothuexemay_mobile/models/booking_transaction.dart';
import 'package:flutter/cupertino.dart';

class BookingTransactionViewModel extends ChangeNotifier {
  final IBookingRepository _repository = BookingRepository();
  Future<BookingTranstion> getById(String id) async {
    return await _repository.getBookingTransactionById(id);
  }
}
