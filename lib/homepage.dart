import 'package:clock_app/enums.dart';
import 'package:clock_app/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'data.dart';
import 'clockpage.dart';
import 'alarmpage.dart';
import 'stopwatch_page.dart';
import 'timer_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Column(
        children: [
          Expanded(
            child: Consumer<MenuInfo>(
                builder: (BuildContext context, MenuInfo value, Widget child) {
              if (value.menuType == MenuType.clock)
                return ClockPage();
              else if (value.menuType == MenuType.alarm)
                return AlarmPage();
              else if (value.menuType == MenuType.stopwatch)
                return StopwatchPage();
              else if (value.menuType == MenuType.timer)
                return TimerPage();
              else
                return Container();
            }),
          ),
          Divider(
            color: Colors.white54,
            height: 1,
          ),
          Divider(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                // don't use the menu button 4 times
                // have to use the state management package
                menuItems
                    .map((currentMenuInfo) => menuButton(currentMenuInfo))
                    .toList(),
          ),
        ],
      ),
    );
  }
}

Widget menuButton(MenuInfo currentMenuInfo) {
  return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget child) {
    return FlatButton(
      color: currentMenuInfo.menuType == value.menuType
          ? Colors.green
          : Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
      ),
      onPressed: () {
        var menuInfo = Provider.of<MenuInfo>(context, listen: false);
        menuInfo.updateMenu(currentMenuInfo);
      },
      child: Column(
        children: [
          Image.asset(
            currentMenuInfo.imageSource,
            scale: 16,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            currentMenuInfo.title ?? '',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 18,
          ),
        ],
      ),
    );
  });
}
