import 'package:housework/tasks/valueobjects/task-status.dart';

class Task {
  int id;
  String title;
  String author;
  String taker;
  TaskStatus status;
  DateTime doneDate;
  String reviewer;
  DateTime reviewedDate;
  int points;

  Task(int id, String title, int points, String author) {
    this.id = id;
    this.title = title;
    this.points = points;
    this.author = author;
    this.status = TaskStatus.OPEN;
  }

  void moveTaskToReview(String taker) {
    this.status = TaskStatus.REVIEW;
    this.taker = taker;
    this.doneDate = DateTime.now();
  }

  void moveTaskToDone(String reviewer) {
    this.status = TaskStatus.APPROVED;
    this.reviewer = reviewer;
    this.reviewedDate = DateTime.now();
  }
}
