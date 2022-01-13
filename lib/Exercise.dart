class Exercise {
  String name;
  String category; //what equipment they have
  String muscleGroups;
  //list incase there are more than one groups being worked
  String type; //push, pull, legs, HIIT etc etc
  int sets;
  int reps;
  double weight;

  Exercise(this.name, this.category, this.muscleGroups, this.type, this.sets,
      this.reps, this.weight);
}
