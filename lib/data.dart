import 'package:clock_app/enums.dart';

import 'menu_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(
    MenuType.clock,
    title: 'Clock',
    imageSource: 'assets/clock.png',
  ),
  MenuInfo(
    MenuType.alarm,
    title: 'Alarm',
    imageSource: 'assets/a-clock.png',
  ),
  MenuInfo(
    MenuType.stopwatch,
    title: 'Stopwatch',
    imageSource: 'assets/stopwatch.png',
  ),
  MenuInfo(
    MenuType.timer,
    title: 'Timer',
    imageSource: 'assets/timer.png',
  ),
];
