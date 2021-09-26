import 'package:chothuexemay_mobile/Repositories/generic_repository.dart';
import 'package:flutter/material.dart';

abstract class ICustomerRepository extends GenericRepository{
   String sendOTP(String phone);
}