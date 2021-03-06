import 'package:chothuexemay_mobile/Repositories/Implementations/voucher_repository.dart';
import 'package:chothuexemay_mobile/Repositories/Interfaces/voucher_interface.dart';
import 'package:chothuexemay_mobile/models/voucher_model.dart';
import 'package:flutter/cupertino.dart';

class VoucherViewModel extends ChangeNotifier {
  final IVoucherRepository _repository = VoucherRepository();
  List<Voucher> vouchers = [];
  int calculateDate(DateTime date) {
    int result = 0;
    DateTime now = DateTime.now();
    Duration duration = date.difference(now);
    if (duration.inMinutes > 0) {
      result = duration.inDays + 1;
    } else {
      result = duration.inDays;
    }
    return result;
  }

  String convertDateTimeToString(DateTime date) {
    String result = "";
    result = date.toString().split(" ")[0].replaceAll("-", ".");
    return result;
  }

  double calculatePriceAfterApplyVoucher(Voucher voucher, double price) {
    return price * (1 - voucher.discount / 100);
  }

  Future getAll() async {
    vouchers = await _repository.getAll();
    notifyListeners();
  }

  Future<List<Voucher>> getVouchersToExchange() async {
    notifyListeners();
    return await _repository.getVouchersToExchange();
  }

  Future<bool> exchangePointsToGetVoucher(String voucherId) async {
    return await _repository.exchangePointsToGetVoucher(voucherId);
  }
}
