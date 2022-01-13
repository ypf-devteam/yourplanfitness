import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Profile page", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
        ),
        body: _DummyButton());
  }
}

class _DummyButton extends StatefulWidget {
  const _DummyButton({Key key}) : super(key: key);
  @override
  State<_DummyButton> createState() => __DummyButtonState();
}

class __DummyButtonState extends State<_DummyButton> {
  var dbRef = FirebaseDatabase.instance.reference().child("Workouts");
  List<String> test = ["Balls", "Are", "Sweaty"];
  void makeWorkout() {
    dbRef.push().set({
      'name': "pull",
      'muscleGroups': test,
      'difficulty': "yes",
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text("POOSH"),
        onPressed: makeWorkout,
      ),
    );
  }
}
