import 'package:flutter/material.dart';
import 'package:fluvies/application/base/base_application_view.dart';

void main() {
  runApp(FluviesApp());
}

class FluviesApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluvies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BaseApplicationView(),
    );
  }
}
