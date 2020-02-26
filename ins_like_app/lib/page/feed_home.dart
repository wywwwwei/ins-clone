import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ins_like_app/page/feed_body.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  static const platform = const MethodChannel('samples.flutter.dev/battery');
  int _batteryValue = 100;

  Future<void> _getBatteryValue() async {
    int batteryValue;
    try {
      final int result = await platform.invokeMethod('getBatteryValue');
      batteryValue = result;
    } on PlatformException catch (e) {
      batteryValue = 0;
    }

    setState(() {
      _batteryValue = batteryValue;
    });
  }

  @override
  void initState(){
    super.initState();
    _getBatteryValue();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Icon(Icons.camera_alt)),
        title:Text("Share"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:12.0),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  child: Icon(Icons.battery_unknown),
                  onTap: _getBatteryValue,
                ),
                Text('$_batteryValue %')

              ],
            ),
          )
        ],
      ),
      body: HomeBody(),
    );
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}