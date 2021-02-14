import 'package:housework/tasks/entities/task.dart';

class DummyTasksService {
  List<Task> tasks;

  DummyTasksService() {
    tasks = new List<Task>();
    initializeTaskList();
  }

  List<Task> getTasks() {
    return tasks;
  }

  void initializeTaskList() {
    tasks.add(new Task(1, 'fold laundry', 75, 'Isi'));
    tasks.add(new Task(2, 'wash dishes', 50, 'Isi'));
    tasks.add(new Task(3, 'bring out trash bin', 25, 'Isi'));
    tasks.add(new Task(4, 'throw out trash', 5, 'Seb'));
    tasks.add(new Task(5, 'vacuum', 125, 'Seb'));
  }
}