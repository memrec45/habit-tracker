import 'package:flutter/material.dart';
import 'package:habit_tracker/models/habit_model.dart';
import 'package:habit_tracker/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'constants.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: ((context) => HabitModel(id: 0, habitName: "habitName")),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: bgColor,
        primaryColor: habitTileColor,
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: habitTileColor,
            onPrimary: Colors.black,
            secondary: bgColor,
            onSecondary: Colors.white,
            error: Colors.red,
            onError: Colors.white,
            background: buttonColor,
            onBackground: Colors.white,
            surface: bgColor,
            onSurface: Colors.black,
          ),
          buttonColor: buttonColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
