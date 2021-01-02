import 'package:flutter/material.dart';
import 'package:productuvity_timer/widgets.dart';

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
          SettingButton(Color(0xff455A64), "-", -1),
          TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),
          SettingButton(Color(0xff009688), '+', 1),
          // Short Break
          Text(
            'Short',
            style: textStyle,
          ),
          Text(''),
          Text(''),
          SettingButton(Color(0xff455A64), "-", -1),
          TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),
          SettingButton(Color(0xff009688), '+', 1),
          // Long Break
          Text(
            'Long',
            style: textStyle,
          ),
          Text(''),
          Text(''),
          SettingButton(Color(0xff455A64), "-", -1),
          TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),
          SettingButton(Color(0xff009688), '+', 1),
        ],
        padding: const EdgeInsets.all(20),
      ),
    );
  }
}
