import 'package:flutter/material.dart';
import 'package:login_demo/provider/data_provider.dart';
import 'package:provider/provider.dart';

import 'screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: DataProvider(),
      child: MaterialApp(
        title: 'Login Demo',
        theme: ThemeData(
            primarySwatch: Colors.green, accentColor: Colors.green[400]),
        home: LoginScreen(),
      ),
    );
  }
}
