import 'package:flutter/material.dart';
import 'package:your_plan_fitness/Exercise.dart';
import 'package:your_plan_fitness/ExerciseWidget.dart';
import 'package:firebase_database/firebase_database.dart';

List<Exercise> _items = [];

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
  var dbRef = FirebaseDatabase.instance.reference().child("Exercises");

  void fillWorkouts() {
    dbRef.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, value) {
        print(values);
        setState(() {
          _items.add(new Exercise(
              value['name'],
              value['category'],
              value['groups'],
              value['type'],
              value['sets'],
              value['reps'],
              value['weight']));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_items.isEmpty) {
      fillWorkouts();
      print(_items);
    }
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        for (int index = 0; index < _items.length; index++)
          ExcerciseWidget(
            dayText: _items[index].name,
            workoutName: _items[index].category,
            widgetHeight: MediaQuery.of(context).size.height / _items.length,
            key: ValueKey(index),
          ),
      ],
    );
  }
}
