import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/habit_model.dart';

class HabitTile extends StatefulWidget {
  HabitTile({
    Key? key,
    required this.index,
    required this.habitName,
    required this.isItDone,
    required this.isItTime,
    required this.time,
    required this.checked,
  }) : super(key: key);

  final int index;
  final String habitName;
  bool isItDone;

  final bool isItTime;

  final Duration? time;

  final Function checked;

  @override
  State<HabitTile> createState() => _HabitTileState();
}

class _HabitTileState extends State<HabitTile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HabitModel>(
      builder: ((context, val, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            child: ListTile(
              contentPadding:const EdgeInsets.all(10),
              leading: Checkbox(
                value: widget.isItDone,
                onChanged: (_) {
                  widget.checked(widget.index);
                },
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              tileColor: Theme.of(context).primaryColor,
              title: Text(widget.habitName),
            ),
          ),
        );
      }),
    );
  }
}
