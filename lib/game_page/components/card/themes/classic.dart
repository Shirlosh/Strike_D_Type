import 'package:flutter/material.dart';

class ClassicTheme
{
  static List<IconData> icons = [null,Icons.icecream_sharp, Icons.shuffle,Icons.score,Icons.accessibility_new_sharp,Icons.ac_unit_sharp,Icons.access_alarm];
  static List<Color> colors = [null,Colors.yellow,Colors.black,Colors.indigo,Colors.green,Colors.deepOrange,Colors.brown];

  static IconData getIcon(int i)
  {
    return icons[i];
  }

  static Color getColor(int i)
  {
    return colors[i];
  }
}