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
        return SliverPadding(
          padding: const EdgeInsetsDirectional.all(0),
          sliver: habitData.isEmpty
              ? const SliverToBoxAdapter(
                  child: Center(
                    child: Text("Add"),
                  ),
                )
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
