import 'package:flutter/material.dart';

import 'InsideWorkout.dart';

class ExcerciseWidget extends StatelessWidget {
  final String dayText;
  final String workoutName;
  final double widgetHeight;
  final Key key;

  const ExcerciseWidget(
      {this.dayText, this.workoutName, this.widgetHeight, this.key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: this.widgetHeight,
      child: InkWell(
        onTap: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => InsideWorkout()))
        },
        child: Card(
          margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
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
