import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:habit_tracker/constants.dart';
import 'package:habit_tracker/models/habit_model.dart';
import 'package:provider/provider.dart';

class AddNewHabit extends StatefulWidget {
  AddNewHabit({Key? key}) : super(key: key);

  @override
  State<AddNewHabit> createState() => _AddNewHabitState();
}

class _AddNewHabitState extends State<AddNewHabit> {
  final TextEditingController _habitNameController = TextEditingController();
  final TextEditingController _habitTimeController = TextEditingController();
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<HabitModel>(builder: ((context, value, child) {
      return AlertDialog(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text("Add New Habit"),
            Divider(
              thickness: 3,
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Habit Name Input Field
            HabitNameField(habitNameController: _habitNameController),
            //CustomCheckBox(check: check,),
            // Time checkbox
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              secondary: const Icon(Icons.access_time),
              contentPadding: const EdgeInsets.only(bottom: 5),
              title: const Text("Do you want to track this habit by time ?"),
              value: check,
              onChanged: ((value) {
                setState(() {
                  check = !check;
                });
              }),
            ),
            const SizedBox(height: 5,),
            check
                ? GoalTimeInputField(habitTimeController: _habitTimeController)
                : const SizedBox(),
            //Buttons Row

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //cancel button
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
                const SizedBox(
                  width: 10,
                ),
                // add button
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      ButtonTheme.of(context).colorScheme?.background,
                    ),
                  ),
                  onPressed: () {
                    value.addHabit(
                        habitName: _habitNameController.text,
                        isItTime: check,
                        goalTime: check ? Duration(
                            minutes: int.parse(_habitTimeController.text)) : null );
                    Navigator.of(context).pop();
                  },
                  child: const Text("Add"),
                ),
              ],
            )
          ],
        ),
      );
    }));
  }
}

class GoalTimeInputField extends StatelessWidget {
  const GoalTimeInputField({
    Key? key,
    required TextEditingController habitTimeController,
  })  : _habitTimeController = habitTimeController,
        super(key: key);

  final TextEditingController _habitTimeController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _habitTimeController,
      cursorHeight: 25,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        // Borders
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: 1),
        ),
        prefixIcon: const Icon(
          Icons.access_time_rounded,
        ),
        hintText: "Write down your goal time...",
        label: const Text("Time"),
        labelStyle: const TextStyle(
          fontSize: 24,
          color: Colors.black54,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}

class HabitNameField extends StatelessWidget {
  const HabitNameField({
    Key? key,
    required TextEditingController habitNameController,
  })  : _habitNameController = habitNameController,
        super(key: key);

  final TextEditingController _habitNameController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _habitNameController,
      cursorHeight: 25,
      decoration: InputDecoration(
        // Borders
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: 1),
        ),
        hintText: "Write down the habit you want...",
        label: const Text("Habit Name"),
        labelStyle: const TextStyle(
          fontSize: 24,
          color: Colors.black54,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}

// class CustomCheckBox extends StatefulWidget {
//   CustomCheckBox({
//     required this.check,
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<CustomCheckBox> createState() => _CustomCheckBoxState();

//   bool check;
// }

// class _CustomCheckBoxState extends State<CustomCheckBox> {
//   @override
//   Widget build(BuildContext context) {
//     return CheckboxListTile(
//       controlAffinity: ListTileControlAffinity.leading,
//       secondary:const Icon(Icons.access_time),

//       title:const Text("Time ?"),
//         value: widget.check,
//         onChanged: ((value) {
//           setState(() {
//             widget.check = !widget.check;
//           });
//         }));
//   }
// }
