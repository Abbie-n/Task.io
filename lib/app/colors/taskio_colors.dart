import 'package:flutter/material.dart';

class TaskioColors {
  static const int _orangePrimaryValue = 0xFFfABB18;
  static const int _grey = 0xFF696969;
  static const white = Color(0xffffffff);
  static const black = Color(0xFF000000);

  static const MaterialColor orange = MaterialColor(
    _orangePrimaryValue,
    <int, Color>{
      500: Color(_orangePrimaryValue),
      600: Color(0xFFE9B734),
      700: Color(0xFFebc462)
    },
  );

  static const MaterialColor grey = MaterialColor(
    _grey,
    <int, Color>{
      500: Color(_grey),
      600: Color(0xFFeeeeee),
      700: Color(0xff3c3c3c)
    },
  );
}
