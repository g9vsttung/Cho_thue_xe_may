import 'package:flutter/material.dart';

abstract class GenericRepository<T> {
  Future<void> getAll();
}
