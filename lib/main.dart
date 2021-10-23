import 'package:flutter/material.dart';
import 'package:plants/pages/home_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plants UI',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'OpenSans',
      ),
      home: HomePage(),
    );
  }
}
