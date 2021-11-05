// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class ColorConstants {
  static const Color background = Color.fromRGBO(64, 151, 62, 1);
  static const Color normalIcon = Colors.white;
  static const Color selectedIcon = Color.fromRGBO(72, 65, 65, 1);
  static const Color briefBackground = Color.fromRGBO(244, 243, 243, 1);
  static const Color containerBackground = Color.fromRGBO(239, 252, 237, 1);
  static const Color containerBoldBackground = Color.fromRGBO(141, 229, 126, 1);
  static const Color textBold = Color.fromRGBO(29, 87, 28, 1);
  static const Color unavailableStar = Color.fromRGBO(178, 176, 176, 1);
}

class StringConstants {
  static const String imageDirectory = "assets/images/";
  static const String iconDirectory = "assets/icons/";
}

class GlobalDataConstants {
  static const String USERID = "userID";
  static const String AREAID = "areaId";
  static const String TOKEN = "token";
  static const String USER_NAME = "userName";
}

class ImageConstants {
  static String getFullImagePath(String img) {
    const _token = "7db7d73c-c7bb-4265-b21f-095a97a3986f";
    return "https://firebasestorage.googleapis.com/v0/b/chothuexemay-35838.appspot.com/o/BikeImages%2F$img?alt=media&token=$_token";
  }
}
