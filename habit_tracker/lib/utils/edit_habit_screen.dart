import 'package:flutter/material.dart';

class EditHabit extends StatefulWidget {
  EditHabit({
    Key? key,
    required this.index,
    required this.editHabit,
    required this.habitName,
    required this.goalTime,
    required this.isItTime,
  }) : super(key: key);

  final int index;
  final Function editHabit;
  final String habitName;
  final Duration? goalTime;
  TextEditingController _habitNameController = TextEditingController();

  TextEditingController _habitTimeController = TextEditingController();
  bool isItTime;

  @override
  State<EditHabit> createState() => _EditHabitState();
}

class _EditHabitState extends State<EditHabit> {
  get timeInMinutes {
    if(widget.goalTime == null){
      return 0;
    }
    int? minutes = widget.goalTime?.inMinutes;
    return minutes;
  }

  @override
  void initState() {
    super.initState();
    widget._habitNameController.text = widget.habitName;
    widget._habitTimeController.text = timeInMinutes == 0 ? "" : timeInMinutes.toString();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).backgroundColor,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Edit ${widget.habitName}"),
          const Divider(
            thickness: 3,
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Habit Name Input Field
          HabitNameField(
            habitNameController: widget._habitNameController,
            habitName: widget.habitName,
          ),
          
          // Time checkbox
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            secondary: const Icon(Icons.access_time),
            contentPadding: const EdgeInsets.only(bottom: 5),
            title: const Text("Do you want to track this habit by time ?"),
            value: widget.isItTime,
            onChanged: ((value) {
              setState(() {
                widget.isItTime = !widget.isItTime;
              });
            }),
          ),
          SizedBox(height: 10,),
          widget.isItTime
              ? GoalTimeInputField(
                  habitTimeController: widget._habitTimeController,
                  oldGoalTime: timeInMinutes)
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
              // Update button
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    ButtonTheme.of(context).colorScheme?.background,
                  ),
                ),
                onPressed: () {
                  widget.editHabit(
                      index: widget.index,
                      habitName: widget._habitNameController.text,
                      isItTime: widget.isItTime,
                      goalTime: widget.isItTime
                          ? Duration(
                              minutes:
                                  int.parse(widget._habitTimeController.text),
                            )
                          : const Duration());
                  Navigator.of(context).pop();
                },
                child: const Text("Update"),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class GoalTimeInputField extends StatelessWidget {
  const GoalTimeInputField({
    Key? key,
    required TextEditingController habitTimeController,
    required this.oldGoalTime,
  })  : _habitTimeController = habitTimeController,
        super(key: key);

  final TextEditingController _habitTimeController;
  final int oldGoalTime;
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
  HabitNameField({
    Key? key,
    required TextEditingController habitNameController,
    required this.habitName,
  })  : _habitNameController = habitNameController,
        super(key: key);

  TextEditingController _habitNameController;
  final String habitName;
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
