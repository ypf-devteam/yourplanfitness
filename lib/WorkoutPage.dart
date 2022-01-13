import 'package:flutter/material.dart';
import 'package:your_plan_fitness/Workout.dart';
import 'package:your_plan_fitness/WorkoutWidget.dart';
import 'package:firebase_database/firebase_database.dart';

List<Workout> _items = [];

class WorkoutPage extends StatefulWidget {
  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  @override
  Widget build(BuildContext context) {
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
  var dbRef = FirebaseDatabase.instance.reference().child("Workouts");

  void initState() {
    workoutListener();
    super.initState();
  }

  void updateWorkouts() {
    for (int i = 0; i < _items.length; i++) {
      _items.remove(i);
    }
    fillWorkouts();
  }

  void workoutListener() {
    // ignore: unused_local_variable
    // ignore: cancel_subscriptions
    var listen = FirebaseDatabase.instance
        .reference()
        .child("Workouts")
        .onChildChanged
        .listen((event) {
      print("YESSSSSSSSSSS");
      updateWorkouts();
    });
  }

  void fillWorkouts() {
    dbRef.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, value) {
        print(values);
        setState(() {
          _items.add(new Workout(value['name'], "poggers", value['exerciseUID'],
              value['difficulty']));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_items.length);
    if (_items.isEmpty) {
      fillWorkouts();
    }
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height - 192,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              for (int index = 0; index < _items.length; index++)
                WorkoutWidget(
                  dayText: _items[index].name,
                  workoutName: _items[index].difficulty,
                  key: ValueKey(index),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
