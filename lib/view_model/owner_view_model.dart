import 'package:chothuexemay_mobile/Repositories/Implementations/owner_repository.dart';
import 'package:chothuexemay_mobile/models/owner_model.dart';
import 'package:flutter/cupertino.dart';

class OwnerViewModel extends ChangeNotifier {
  final List<Owner> owners = [];
  Owner? owner;
  OwnerRepository ownerRepository = OwnerRepository();
  void getAll() async {
    owners.clear();
    Future<List<Owner>> a = ownerRepository.getAll();
    await ownerRepository.getAll().then((value) => value.forEach((element) {
          owners.add(element);
        }));
    notifyListeners();
  }

  void getOwnerById(String id) async {
    owner = await ownerRepository.getOwnerById(id);
    notifyListeners();
  }
}
