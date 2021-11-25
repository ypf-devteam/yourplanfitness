import 'package:flutter/material.dart';

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
      child: Card(
        margin: const EdgeInsets.fromLTRB(30, 30, 30, 40),
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
    );
  }
}
