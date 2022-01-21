import 'package:flutter/material.dart';
import 'package:your_plan_fitness/SetRowWidget.dart';
import 'package:your_plan_fitness/custom_rect_tween.dart';

class ExercisePopupCard extends StatelessWidget {
  final String _heroAddTodo = 'add-todo-hero';
  final int setAmounts;
  final double pastWeight;

  /// {@macro add_todo_popup_card}
  const ExercisePopupCard({Key key, this.setAmounts, this.pastWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroAddTodo,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },
          child: Material(
            color: Colors.white,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.fromLTRB(40, 0, 20, 0)),
                        Text("Reps"),
                        Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                        Text("Past \n Weight"),
                        Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0)),
                        Text("New \n Weight"),
                      ],
                    ),
                    for (int i = 1; i <= setAmounts; i++)
                      SetRowWidget(
                        reps: setAmounts,
                        pastWeight: pastWeight,
                        setCount: i,
                      ),
                    Container(
                      alignment: Alignment.center,
                      child: TextButton(
                        // color: Color(0xFF00BFFF),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          primary: Color(0xFF00BFFF),
                        ),
                        child: const Text('Close'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
