import 'package:clock_app/clock_page.dart';
import 'package:clock_app/enums.dart';
import 'package:clock_app/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) {
      offsetSign = '+';
    }
    print(timezoneString);
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Column(
        children: [
          Expanded(
            child: Consumer<MenuInfo>(
                builder: (BuildContext context, MenuInfo value, Widget child) {
              if (value.menuType != MenuType.clock) return Container();
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 34),
                alignment: Alignment.center,
                color: Colors.blueGrey[900],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Text(
                        'Clock',
                        style: TextStyle(color: Colors.white, fontSize: 24.0),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formattedTime,
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                          Text(
                            formattedDate,
                            style:
                                TextStyle(color: Colors.white, fontSize: 17.0),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 7,
                      fit: FlexFit.tight,
                      child: Align(
                        alignment: Alignment.center,
                        child: ClockView(
                          size: MediaQuery.of(context).size.height / 3,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Timezone',
                            style:
                                TextStyle(color: Colors.white, fontSize: 24.0),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.language,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                'UTC ' + offsetSign + timezoneString,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24.0),
                              ),
                            ],
                          ),
                          // Text(
                          //   'UTC ' + offsetSign + timezoneString,
                          //   style: TextStyle(color: Colors.white, fontSize: 24.0),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
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
