import 'package:flutter/material.dart';

class WorkoutWidget extends StatelessWidget {
  final String text;
  final Key key;

  const WorkoutWidget({this.text, this.key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Card(
            child: Text(text, key: key),
          )
        ],
      ),
    );
  }
}
