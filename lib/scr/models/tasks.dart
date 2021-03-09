enum TaskCategory { Home, Work, Airport, Shopping }

class Task {
  bool isFinished;
  // DateTime from;
  // DateTime to;
  String title;
  String details;
  TaskCategory category;

  Task({this.title, this.details, this.category, this.isFinished = false});
}
