import 'package:chothuexemay_mobile/Repositories/Interfaces/motor_type_interface.dart';
import 'package:chothuexemay_mobile/models/motor_type_model.dart';
import 'package:chothuexemay_mobile/services/motor_type_service.dart';

class MotorTypeRepository implements IMotorType {
  final MotorTypeService _motorTypeService = MotorTypeService();
  @override
  Future<List<MotorType>> getAll() async {
    return await _motorTypeService.getAll();
  }
}
