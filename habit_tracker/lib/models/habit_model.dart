import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class HabitModel extends ChangeNotifier {
  final int id;
  final String habitName;
  final bool isItDone;

  final bool isItTime;

  final Duration? time;

  HabitModel({
    required this.id,
    this.isItDone = false,
    this.isItTime = false,
    Duration? this.time,
    required this.habitName,
  });

  // add Habit
  void addHabit(String habitName) {
    habitList.add(
      {
        "id": Random().nextInt(35),
      "habitName": habitName,
      "isItDone": false,
      "isItTime": false,
      "time": Duration()
      }
    );
    notifyListeners();
    
  }
  // Update habit
  void editHabit(int index) {

    notifyListeners();
  }
  //Delete habit
  void deleteHabit(int index) {

    habitList.removeAt(index);


    notifyListeners();
  }

  void check(int index) {
    habitList[index]["isItDone"] = !habitList[index]["isItDone"];

    notifyListeners();
  }

  List habitList = [
    {
      "id": Random().nextInt(35),
      "habitName": "Dummy 1",
      "isItDone": false,
      "isItTime": false,
      "time": Duration()
    },
    {
      "id": Random().nextInt(35),
      "habitName": "Dummy 2",
      "isItDone": false,
      "isItTime": false,
      "time": Duration()
    },
    {
      "id": Random().nextInt(35),
      "habitName": "Dummy 3",
      "isItDone": false,
      "isItTime": false,
      "time": Duration()
    },
    {
      "id": Random().nextInt(35),
      "habitName": "Dummy 4",
      "isItDone": false,
      "isItTime": false,
      "time": Duration()
    },
    {
      "id": Random().nextInt(35),
      "habitName": "Dummy 5",
      "isItDone": false,
      "isItTime": false,
      "time": Duration()
    },
    {
      "id": Random().nextInt(35),
      "habitName": "Dummy 6",
      "isItDone": false,
      "isItTime": false,
      "time": Duration()
    },
  ];
} // end of HabitModel
