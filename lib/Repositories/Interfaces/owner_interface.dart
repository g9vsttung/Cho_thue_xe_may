import 'package:chothuexemay_mobile/Repositories/generic_repository.dart';
import 'package:chothuexemay_mobile/models/owner_model.dart';

abstract class IOwnerRepository extends GenericRepository {
  Future<Owner> getOwnerById(String id);
}
