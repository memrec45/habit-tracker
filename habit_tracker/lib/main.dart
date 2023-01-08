import 'package:flutter/material.dart';
import 'package:habit_tracker/pages/home_page.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        backgroundColor: bgColor,
        primaryColor: habitTileColor,
        buttonColor: buttonColor,
        
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
