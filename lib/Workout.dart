import 'package:your_plan_fitness/Exercise.dart';

class Workout {
  String name;
  String uid; //uid for the workout itself
  List<String> muscleGroups;
  String difficulty;

  Workout(this.name, this.uid, this.muscleGroups, this.difficulty);
}
