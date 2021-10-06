import 'package:chothuexemay_mobile/Repositories/Interfaces/owner_interface.dart';
import 'package:chothuexemay_mobile/models/owner_model.dart';
import 'package:chothuexemay_mobile/services/owner_service.dart';

class OwnerRepository implements IOwnerRepository {
  OwnerService service = OwnerService();
  @override
  Future<List<Owner>> getAll() async {
    Future.delayed(const Duration(seconds: 5));
    return service.getAll();
  }
}
