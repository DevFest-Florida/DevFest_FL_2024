import 'package:flutter/material.dart';

class Tools {
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static List<Color> multiColors = [
    Colors.red,
    Colors.amber,
    Colors.green,
    Colors.blue,
  ];

  static Color getMultiColor(BuildContext context, int index) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    if (isDark) {
      return [
        Colors.redAccent,
        Colors.amberAccent,
        Colors.lightGreenAccent,
        Colors.lightBlueAccent,
      ][index % 4];
    }
    return multiColors[index % 4];
  }
}