import 'package:clock_app/clock_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // don't use the menu button 4 times
              // have to use the state management package
              menuButton('Clock', 'assets/clock.png'),
              menuButton('Alarm', 'assets/a-clock.png'),
              menuButton('Stopwatch', 'assets/stopwatch.png'),
              menuButton('Timer', 'assets/timer.png'),
            ],
          ),
          VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
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
                          style: TextStyle(color: Colors.white, fontSize: 64.0),
                        ),
                        Text(
                          formattedDate,
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 4,
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
                              style: TextStyle(
                                  color: Colors.white, fontSize: 24.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget menuButton(String title, String image) {
  return FlatButton(
    onPressed: () {},
    child: Column(
      children: [
        Image.asset(
          image,
          scale: 14,
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          title ?? '',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 18,
        ),
      ],
    ),
  );
}
