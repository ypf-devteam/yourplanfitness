import 'package:flutter/material.dart';
import 'package:your_plan_fitness/ExercisePopupCard.dart';
import 'package:your_plan_fitness/custom_rect_tween.dart';
import 'package:your_plan_fitness/hero_dialog_route.dart';

import 'InsideWorkout.dart';

class ExcerciseWidget extends StatelessWidget {
  final String exerciseName;
  final int sets;
  final int reps;
  final double weight;
  final double widgetHeight;
  final Key key;
  final String _heroAddTodo = 'add-todo-hero';

  const ExcerciseWidget(
      {this.exerciseName,
      this.sets,
      this.reps,
      this.weight,
      this.widgetHeight,
      this.key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: this.widgetHeight,
      child: Card(
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(1, 0, 0, 0)),
            ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.add_a_photo, color: Colors.white),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
                primary: Colors.blue, // <-- Button color
                onPrimary: Colors.lightGreen, // <-- Splash color
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  width: 200,
                  child: Text(
                    exerciseName,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          "Sets",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "2",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0)),
                    Column(
                      children: <Widget>[
                        Text(
                          "Reps",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "0",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0)),
                    Column(
                      children: <Widget>[
                        Text(
                          "Weight",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "0",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                  return ExercisePopupCard(
                    setAmounts: sets,
                    pastWeight: weight,
                  );
                }));
                Hero(
                  tag: _heroAddTodo,
                  createRectTween: (begin, end) {
                    return CustomRectTween(begin: begin, end: end);
                  },
                  child: Material(
                    color: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                  ),
                );
              },
              child: Icon(Icons.add, color: Colors.white),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
                primary: Colors.lightGreen, // <-- Button color
                onPrimary: Colors.blue, // <-- Splash color
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 1, 0)),
          ],
        ),
      ),
    );
  }
}
