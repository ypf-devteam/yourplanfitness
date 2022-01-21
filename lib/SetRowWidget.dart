import 'package:flutter/material.dart';

class SetRowWidget extends StatelessWidget {
  final int reps;
  final double pastWeight;
  final int setCount;
  const SetRowWidget({Key key, this.reps, this.pastWeight, this.setCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Text("Set " + setCount.toString()),
          Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0)),
          Text(reps.toString()),
          Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0)),
          Text(pastWeight.toString()),
          Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0)),
          Expanded(
              child: TextField(
            keyboardType: TextInputType.number,
          ))
        ],
      ),
    );
  }
}
