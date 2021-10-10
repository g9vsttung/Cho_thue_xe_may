import 'package:chothuexemay_mobile/Repositories/generic_repository.dart';

abstract class ICustomerRepository extends GenericRepository {
  Future<bool> login(String phone);
}
