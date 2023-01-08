import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:habit_tracker/constants.dart';
import 'package:habit_tracker/models/habit_model.dart';
import 'package:provider/provider.dart';

class AddNewHabit extends StatelessWidget {
  AddNewHabit({Key? key}) : super(key: key);

  final TextEditingController _habitNameController = TextEditingController();

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
        content: Container(
          height: 150,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //Habit Name Input Field
              TextField(
                controller: _habitNameController,
                cursorHeight: 25,
                decoration: InputDecoration(
                  // border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(15),
                  //     borderSide: const BorderSide(width: 1)),
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
              ),
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
                  SizedBox(
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
                      value.addHabit(_habitNameController.text);
                      Navigator.of(context).pop();
                    },
                    child: const Text("Add"),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }));
  }
}
