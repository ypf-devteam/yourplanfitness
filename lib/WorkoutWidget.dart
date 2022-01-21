import 'package:flutter/material.dart';

import 'InsideWorkout.dart';

class WorkoutWidget extends StatelessWidget {
  final String dayText;
  final String workoutName;
  final int workoutType;
  final Key key;
  final List<String> backgroundImages = [
    "assets/images/bench-press.jpg",
    "assets/images/lat-pull-down.jpg"
  ];

  WorkoutWidget({this.dayText, this.workoutName, this.workoutType, this.key})
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
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: workoutType < backgroundImages.length
                    ? AssetImage(backgroundImages[workoutType])
                    : AssetImage(backgroundImages[0]),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
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
      ),
    );
  }
}
