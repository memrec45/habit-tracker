import 'package:flutter/material.dart';
import 'package:habit_tracker/utils/edit_habit_screen.dart';
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
  get timeInMinutes {
    /* 
      The purpose of this getter is transforming the time(Duration object) to String.
      This way I can use the time(Duration object) inside the Text() widget.
    */
    String? minutes = widget.time?.inMinutes.toString();
    return minutes;
  }

  void showEditHabitScreen(int index, Function editHabit) {
    // A funtion for showing the edit popup.
    // It shows the EditHabit widget
    showDialog(
        context: context,
        builder: (context) => EditHabit(
              index: index,
              editHabit: editHabit,
              goalTime: widget.time,
              habitName: widget.habitName,
              isItTime: widget.isItTime,
            ));
  }

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
              // This actionPane shows the Delete and Edit buttons
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  // Slidable Delete button
                  SlidableAction(
                    label: "Delete",
                    backgroundColor: Colors.red,
                    icon: Icons.delete,
                    onPressed: (_) {
                      val.deleteHabit(widget.index);
                    },
                  ),
                  // Slidable Edit Button
                  SlidableAction(
                    label: "Edit",
                    icon: Icons.settings,
                    onPressed: (_) {
                      showEditHabitScreen(widget.index, val.editHabit);
                    },
                  )
                ],
              ),
              // This is the body of the List Items.
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                tileColor: Theme.of(context).primaryColor,

                //CheckBox
                // TODO: if isItTİme = true show start button
                leading: Checkbox(
                  value: widget.isItDone,
                  onChanged: (_) {
                    widget.checked(widget.index);
                  },
                ),

                // Habit Name
                title: Text(
                  widget.habitName,
                  style: widget.isItDone
                      // if the Item is done(cehcked is true) then show a Text with lineThrough if not show a normal Text.
                      ? const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.black45,
                        )
                      : const TextStyle(
                          decoration: TextDecoration.none,
                        ),
                ),

                // if its isItTime is true then Clock icon and the goalTime will be shown on the trailing of ListTile
                trailing: widget.isItTime
                    ? Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          // TODO: Add button for starting the timer.
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.access_time_outlined),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "$timeInMinutes''",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black54),
                            )
                          ],
                        ),
                      )
                    : const SizedBox(),
              ),
            ),
          ),
        );
      }),
    );
  }
}
