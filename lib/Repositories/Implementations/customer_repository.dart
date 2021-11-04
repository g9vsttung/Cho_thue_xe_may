import 'package:chothuexemay_mobile/Repositories/Interfaces/customer_interface.dart';
import 'package:chothuexemay_mobile/models/customer_model.dart';
import 'package:chothuexemay_mobile/models/order_model.dart';
import 'package:chothuexemay_mobile/models/owner_model.dart';
import 'package:chothuexemay_mobile/services/customer_service.dart';
import 'package:chothuexemay_mobile/services/firebase_database.dart';
import 'package:chothuexemay_mobile/services/geolocation_service.dart';

class CustomerRepository implements ICustomerRepository {
  final CustomerService service = CustomerService();
  final FirebaseDatabaseCustom _databaseCustom = FirebaseDatabaseCustom();
  final GeoLocatorCustom _geoLocator = GeoLocatorCustom();
  @override
  Future<List<Customer>> getAll() async {
    Future.delayed(const Duration(seconds: 5));
    return service.getAll();
  }

  @override
  Future<bool> login(String phone) async {
    return service.login(phone);
  }

  @override
  Future<void> storingLocation() async {
    _databaseCustom.storingLocationRealtime();
  }

  @override
  Future<String> getAddress() {
    return _geoLocator.getAddress();
  }

  @override
  Future<String> getCityName() {
    return _geoLocator.getCityName();
  }

  @override
  Future<List<Owner>> findBikes(OrderModel model) async {
    return await service.findBikes(model);
  }

  @override
  Future<void> sendNoti(OrderModel order) async {
    service.sendNoti(order);
  }

  @override
  Future<void> createBooking(OrderModel order) async {
    service.createBooking(order);
  }

  @override
  Future<int> getRewardPoints() {
    return service.getRewardPoint();
  }

  @override
  Future<bool> updateProfile() {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

  @override
  Future<Customer> viewProfile() {
    // TODO: implement viewProfile
    throw UnimplementedError();
  }
}
