import 'package:flutter/material.dart';
import 'package:productuvity_timer/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Settings());
  }
}

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextStyle textStyle = TextStyle(fontSize: 24);
  double buttonSize = 3;

  TextEditingController txtWork;
  TextEditingController txtShort;
  TextEditingController txtLong;

  static const String WORKTIME = 'workTime';
  static const String SHORTBREAK = 'shortBreak';
  static const String LONGBREAK = 'longBreak';

  int workTime;
  int shortTime;
  int longTime;

  SharedPreferences prefs;

  @override
  void initState() {
    txtWork = TextEditingController();
    txtShort = TextEditingController();
    txtLong = TextEditingController();
     super.initState();
    readSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,
        childAspectRatio: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: <Widget>[
          // Work
          Text(
            'Work',
            style: textStyle,
          ),
          Text(''),
          Text(''),
          SettingButton(Color(0xff455A64), "-", buttonSize, -1, WORKTIME, updateSetting),
          TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: txtWork,
          ),
          SettingButton(Color(0xff009688), '+', buttonSize, 1, WORKTIME, updateSetting),
          // Short Break
          Text(
            'Short',
            style: textStyle,
          ),
          Text(''),
          Text(''),
          SettingButton(Color(0xff455A64), "-", buttonSize, -1, SHORTBREAK, updateSetting),
          TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: txtShort,
          ),
          SettingButton(Color(0xff009688), '+', buttonSize, 1, SHORTBREAK, updateSetting),
          // Long Break
          Text(
            'Long',
            style: textStyle,
          ),
          Text(''),
          Text(''),
          SettingButton(Color(0xff455A64), "-", buttonSize, -1, LONGBREAK, updateSetting),
          TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: txtLong,
          ),
          SettingButton(Color(0xff009688), '+', buttonSize, 1, LONGBREAK, updateSetting),
        ],
        padding: const EdgeInsets.all(20),
      ),
    );
  }

  readSettings() async {
    prefs = await SharedPreferences.getInstance();
    int workTime = prefs.getInt(WORKTIME);
    if(workTime == null) {
      await prefs.setInt(WORKTIME, int.parse('30'));
    }
    int shortTime = prefs.getInt(SHORTBREAK);
    if(shortTime == null) {
      await prefs.setInt(SHORTBREAK, int.parse('5'));
    }
    int longTime = prefs.getInt(LONGBREAK);
    if(longTime == null) {
      await prefs.setInt(LONGBREAK, int.parse('20'));
    }
    setState(() {
      txtWork.text = workTime.toString();
      txtShort.text = shortTime.toString();
      txtLong.text = longTime.toString();
    });
  }

  void updateSetting(String key, int value) {
    switch (key) {
      case WORKTIME:
        {
          int workTime = prefs.getInt(WORKTIME);
          workTime += value;
          if (workTime >= 1 && workTime <= 180) {
            prefs.setInt(WORKTIME, workTime);
            setState(() {
              txtWork.text = workTime.toString();
            });
          }
        }
        break;
      case SHORTBREAK:
        {
          int short = prefs.getInt(SHORTBREAK);
          short += value;
          if (short >= 1 && short <= 120) {
            prefs.setInt(SHORTBREAK, short);
            setState(() {
              txtShort.text = short.toString();
            });
          }
        }
        break;
      case LONGBREAK:
        {
          int long = prefs.getInt(LONGBREAK);
          long += value;
          if (long >= 1 && long <= 120) {
            prefs.setInt(LONGBREAK, long);
            setState(() {
              txtLong.text = long.toString();
            });
          }
        }
        break;
    }
  }
}
