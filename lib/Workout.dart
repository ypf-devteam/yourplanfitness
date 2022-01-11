import 'package:your_plan_fitness/Exercise.dart';

class Workout {
  String name;
  String uid; //uid for the workout itself
  String exerciseUID; //the set of exercises that are within this day!
  String difficulty;

  Workout(this.name, this.uid, this.exerciseUID, this.difficulty);
}
