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
    tasks.add(new Task(
        1,
        'fold laundry',
        'Take out the laundry from the drying rack or the drying machine. Fold it and put it in the closet, drawer or its rightful place.',
        75));
    tasks.add(new Task(2, 'wash dishes', 'just wash dishes', 50));
    tasks.add(new Task(3, 'bring out trash bin',
        'bring out the trash bin to the roadside', 25));
    tasks.add(new Task(4, 'throw out trash',
        'pick the trash and throw it into the right trash bin.', 5));
    tasks.add(new Task(5, 'vacuum', 'clean the floor with the vacuum', 125));
  }
}
