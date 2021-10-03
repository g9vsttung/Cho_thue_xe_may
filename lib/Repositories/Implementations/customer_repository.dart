import 'package:chothuexemay_mobile/Repositories/Interfaces/customer_interface.dart';
import 'package:chothuexemay_mobile/models/customer_model.dart';
import 'package:chothuexemay_mobile/services/customer_service.dart';

class CustomerRepository implements ICustomerRepository {
  CustomerService service = CustomerService();
  @override
  Future<List<Customer>> getAll() async {
    Future.delayed(const Duration(seconds: 5));
    return service.getAll();
  }

  @override
  String sendOTP(String phone) {
    return "not found";
  }
}
