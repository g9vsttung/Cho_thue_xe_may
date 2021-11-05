// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:chothuexemay_mobile/Repositories/Implementations/owner_repository.dart';
import 'package:chothuexemay_mobile/models/owner_model.dart';
import 'package:flutter/cupertino.dart';

class OwnerViewModel extends ChangeNotifier {
  final List<Owner> owners = [];
  Owner? owner;
  OwnerRepository ownerRepository = OwnerRepository();
  void getAll() async {
    owners.clear();
    await ownerRepository.getAll().then((value) => value.forEach((element) {
          owners.add(element);
        }));
    notifyListeners();
  }

  Future getOwnerById(String id) async {
    owner = await ownerRepository.getOwnerById(id);
    notifyListeners();
  }
}
