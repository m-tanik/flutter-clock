import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'clock_view.dart';

class ClockPage extends StatefulWidget {
  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var offsetSign = '';
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    if (!timezoneString.startsWith('-')) {
      offsetSign = '+';
    }
    print(timezoneString);
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
                  style: TextStyle(color: Colors.white, fontSize: 17.0),
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
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
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
                      style: TextStyle(color: Colors.white, fontSize: 24.0),
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
  }
}
