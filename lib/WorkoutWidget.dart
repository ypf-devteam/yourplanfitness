import 'package:flutter/material.dart';

import 'InsideWorkout.dart';

class WorkoutWidget extends StatelessWidget {
  final String dayText;
  final String workoutName;
  final Key key;

  const WorkoutWidget({this.dayText, this.workoutName, this.key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => InsideWorkout()))
        },
        child: Card(
          margin: const EdgeInsets.fromLTRB(30, 7.5, 30, 7.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                dayText,
                key: key,
                textAlign: TextAlign.center,
              ),
              Text(
                workoutName,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
