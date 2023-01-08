import 'package:flutter/material.dart';
import 'package:habit_tracker/constants.dart';

class MySliverAppBar extends StatefulWidget {
  MySliverAppBar({
    Key? key,
    required this.maxHeight,
    required this.maxwidth,
    required this.scrollController,
  }) : super(key: key);

  final double maxHeight;
  final double maxwidth;
  final scrollController;
  Color _textColor = Colors.white;
  @override
  State<MySliverAppBar> createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {
  @override
  void initState() {
    super.initState();

    widget.scrollController
      ..addListener(() {
        setState(() {
          widget._textColor =
              _isSliverAppBarExpanded ? Colors.black : Colors.red;
        });
      });
  }

//----------
  bool get _isSliverAppBarExpanded {
    // print(_scrollController.offset);
    return widget.scrollController.hasClients &&
        widget.scrollController.offset < (60);
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 2,
      backgroundColor: appBarColor,
      pinned: true,
      expandedHeight: widget.maxHeight * 0.5,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: _isSliverAppBarExpanded,
        titlePadding: const EdgeInsetsDirectional.only(
          start: 10,
          bottom: 15,
        ),
        title: Text(
          "Habit Tracker",
          style: TextStyle(color: widget._textColor),
        ),

        /* TODO: Background of AppBar
                *Pageview 
                  *Graph page
                    *The user should be able to see his/her progress via graph.
                  
                  *Calendar page
                    * In this page user can see his tracked habits on a calendar.

              */
        background: const Placeholder(),
      ),
    );
  }
}
