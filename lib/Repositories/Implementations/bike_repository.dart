import 'package:chothuexemay_mobile/Repositories/Interfaces/bike_interface.dart';
import 'package:chothuexemay_mobile/models/bike_model.dart';
import 'package:chothuexemay_mobile/services/bike_service.dart';

class BikeRepository implements IBikeRepository {
  BikeService service = BikeService();
  @override
  Future<List<Bike>> getAll() async {
    Future.delayed(const Duration(seconds: 5));
    return service.getAll();
  }
}
