import 'package:chothuexemay_mobile/Repositories/Implementations/bike_repository.dart';
import 'package:chothuexemay_mobile/models/bike_model.dart';
import 'package:flutter/cupertino.dart';

class BikeViewModel extends ChangeNotifier {
  final List<Bike> bikes = [];
  BikeRepository bikeRepository = BikeRepository();
  void getAll() async {
    bikes.clear();
    await bikeRepository.getAll().then((value) => value.forEach((element) {
          bikes.add(element);
        }));
    notifyListeners();
  }
}
