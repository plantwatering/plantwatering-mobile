import 'package:flutter/material.dart';

class DevicesScreen extends StatelessWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (context) => DevicesScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Text('Devices', key: Key('title')),
      ),
    ));
  }
}
