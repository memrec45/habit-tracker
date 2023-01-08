import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/habit_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            child: Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  // Slidable Delete button
                  SlidableAction(
                    label: "Delete",
                    backgroundColor: Colors.red,
                    icon: Icons.delete ,
                    onPressed: (_){
                      val.deleteHabit(widget.index);
                    },
                  ),
                  // Slidable Edit Button
                  SlidableAction(
                    label: "Edit",
                    // backgroundColor: Colors.red,
                    icon: Icons.settings ,
                    onPressed: (_){
                      val.editHabit(widget.index);
                    },
                  )
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
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
          ),
        );
      }),
    );
  }
}
