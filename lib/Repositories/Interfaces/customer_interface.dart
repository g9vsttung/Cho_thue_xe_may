import 'package:chothuexemay_mobile/Repositories/generic_repository.dart';
import 'package:chothuexemay_mobile/models/order_model.dart';
import 'package:chothuexemay_mobile/models/owner_model.dart';

abstract class ICustomerRepository extends GenericRepository {
  Future<bool> login(String phone);
  Future<void> storingLocation();
  Future<String> getCityName();
  Future<String> getAddress();
  Future<List<Owner>> findBikes(OrderModel model);
}
