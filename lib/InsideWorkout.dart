import 'package:flutter/material.dart';
import 'package:your_plan_fitness/ExerciseWidget.dart';

class InsideWorkout extends StatefulWidget {
  @override
  _InsideWorkoutState createState() => _InsideWorkoutState();
}

class _InsideWorkoutState extends State<InsideWorkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("This Workout", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final List<int> _items = List<int>.generate(5, (int index) => index);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return ReorderableListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        for (int index = 0; index < _items.length; index++)
          ExcerciseWidget(
            dayText: "Day $index",
            workoutName: "BOOTY BLASTER 6000",
            widgetHeight: MediaQuery.of(context).size.height / _items.length,
            key: ValueKey(index),
          ),
      ],
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final int item = _items.removeAt(oldIndex);
          _items.insert(newIndex, item);
        });
      },
    );
  }
}
