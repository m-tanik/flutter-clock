import 'package:flutter/cupertino.dart';

class AlarmInfo {
  DateTime alarmDateTime;
  bool isActive;
  String description;
  List<Color> gradientColor;

  AlarmInfo(this.alarmDateTime, {this.description, this.gradientColor});
}
