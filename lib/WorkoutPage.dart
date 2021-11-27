import 'package:flutter/material.dart';
import 'package:your_plan_fitness/WorkoutWidget.dart';

class WorkoutPage extends StatefulWidget {
  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  final List<int> _items = List<int>.generate(5, (int index) => index);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Workout page",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: const MyStatefulWidget());
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final List<int> _items = List<int>.generate(5, (int index) => index);
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    var padding = MediaQuery.of(context).padding;

    return Column(
      children: <Widget>[
        SizedBox(
          height:
              MediaQuery.of(context).size.height - padding.top - padding.bottom,
          child: ReorderableListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              for (int index = 0; index < _items.length; index++)
                WorkoutWidget(
                  dayText: "Day $index",
                  workoutName: "BOOTY BLASTER 6000",
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
          ),
        ),
        SizedBox(
          height: 30,
          child: Slider(
            value: _currentSliderValue,
            min: 0,
            max: 100,
            divisions: 5,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
        )
      ],
    );
  }
}
