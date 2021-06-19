import 'package:flutter/material.dart';
import 'package:polynomial/screens/screens.dart';
import 'package:polynomial/utilities/utilities.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Polynomial',
      theme: Constants.appTheme,
      home: SignInScreen(),
    );
  }
}
