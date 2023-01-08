import 'package:flutter/material.dart';
import 'package:habit_tracker/models/habit_model.dart';
import 'package:habit_tracker/utils/habit_section.dart';
import 'package:habit_tracker/utils/sliver_appbar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //late ScrollController _scrollController;

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final double _maxHeight = MediaQuery.of(context).size.height;
    final double _maxwidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (context) => HabitModel(habitName: '', id: 0),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            MySliverAppBar(
              maxHeight: _maxHeight,
              maxwidth: _maxwidth,
              scrollController: _scrollController,
            ),
            // Habit Section
            HabitSection(),
          ],
        ),
      ),
    );
  }
}
