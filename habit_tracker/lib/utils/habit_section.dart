import 'package:flutter/material.dart';
import 'package:habit_tracker/constants.dart';
import 'package:habit_tracker/models/habit_model.dart';
import 'package:provider/provider.dart';

import 'habit_tile.dart';

class HabitSection extends StatelessWidget {
  const HabitSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HabitModel>(
      builder: ((context, val, child) {
        List habitData = val.habitList;
        Widget noHabitContainer = SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: SizedBox(
                  height: 250,
                  width: 240,
                  child: Card(
                    color: Theme.of(context).primaryColor,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "You haven't added any habits to track.\nClick add button and start building new habits.",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
        return SliverPadding(
          padding: const EdgeInsetsDirectional.all(0),
          sliver: habitData.isEmpty
              ? noHabitContainer
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return HabitTile(
                        index: index,
                        habitName: habitData[index]["habitName"],
                        isItDone: habitData[index]["isItDone"],
                        isItTime: habitData[index]["isItTime"],
                        time: habitData[index]["time"],
                        checked: val.check,
                      );
                    },
                    childCount: habitData.length,
                  ),
                ),
        );
      }),
    );
  }
}
