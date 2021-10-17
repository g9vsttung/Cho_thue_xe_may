import 'package:chothuexemay_mobile/Repositories/Interfaces/area_interface.dart';
import 'package:chothuexemay_mobile/services/area_service.dart';

class AreaRepository extends IAreaRepository {
  final AreaService _areaService = AreaService();
  @override
  Future<String> findIdByName(String cityName) {
    return _areaService.getIdByName(cityName);
  }
}
