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
        setState(() {
          _items.add(new Exercise(
              value['name'],
              value['muscleGroups'],
              int.parse(value['sets']),
              int.parse(value['reps']),
              double.parse(value['pastWeight']),
              int.parse(value['difficulty'])));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_items.isEmpty) {
      fillWorkouts();
    }
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        for (int index = 0; index < _items.length; index++)
          ExcerciseWidget(
            exerciseName: _items[index].name,
            sets: _items[index].sets,
            reps: _items[index].reps,
            weight: _items[index].pastWeight,
            widgetHeight: MediaQuery.of(context).size.height /
                (_items.length /
                    2), //constant growing makes the cards bigger, smaller if smaller
            key: ValueKey(index),
          ),
      ],
    );
  }
}
