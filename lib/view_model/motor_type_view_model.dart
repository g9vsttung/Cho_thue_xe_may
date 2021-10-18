import 'package:chothuexemay_mobile/Repositories/Implementations/motor_type_repository.dart';
import 'package:chothuexemay_mobile/models/motor_type_model.dart';
import 'package:flutter/cupertino.dart';

class MotorTypeViewModel extends ChangeNotifier {
  final MotorTypeRepository _motorTypeRepository = MotorTypeRepository();
  final List<MotorType> types = [];

  Future getAll() async {
    types.clear();
    await _motorTypeRepository
        .getAll()
        .then((value) => value.forEach((element) {
              types.add(element);
            }));
    notifyListeners();
  }
}
