import 'package:chothuexemay_mobile/Repositories/generic_repository.dart';
import 'package:chothuexemay_mobile/models/voucher_model.dart';

abstract class IVoucherRepository extends GenericRepository {
  Future<List<Voucher>> getVouchersToExchange();
  Future<bool> exchangePointsToGetVoucher(String voucherId);
}
