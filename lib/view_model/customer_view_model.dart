import 'package:chothuexemay_mobile/Repositories/Implementations/customer_repository.dart';
import 'package:chothuexemay_mobile/models/customer_model.dart';
import 'package:flutter/cupertino.dart';

class CustomerViewModel extends ChangeNotifier {
  final List<Customer> customers = [];
  CustomerRepository customerRepository = CustomerRepository();
  void getAll() async {
    customers.clear();
    await customerRepository.getAll().then((value) => value.forEach((element) {
          customers.add(element);
        }));
    notifyListeners();
  }
}
