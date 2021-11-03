import 'package:chothuexemay_mobile/Repositories/Interfaces/voucher_interface.dart';
import 'package:chothuexemay_mobile/models/voucher_model.dart';
import 'package:chothuexemay_mobile/services/voucher_service.dart';

class VoucherRepository implements IVoucherRepository {
  final VoucherService _service = VoucherService();
  @override
  Future<List<Voucher>> getAll() async {
    return await _service.getAll();
  }
}
