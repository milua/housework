import 'package:housework/tasks/entities/task.dart';
import 'package:housework/valueobjects/point.dart';

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
        id: 1,
        title: 'fold laundry',
        description:
            'Take out the laundry from the drying rack or the drying machine. Fold it and put it in the closet, drawer or its rightful place.',
        points: new Point(value: 75)));
    tasks.add(new Task(
        id: 2,
        title: 'wash dishes',
        description: 'just wash dishes',
        points: new Point(value: 50)));

    tasks.add(new Task(
        id: 3,
        title: 'bring out trash bin',
        description: 'bring out the trash bin to the roadside',
        points: new Point(value: 25)));

    tasks.add(new Task(
        id: 4,
        title: 'throw out trash',
        description: 'pick the trash and throw it into the right trash bin.',
        points: new Point(value: 5)));

    tasks.add(new Task(
        id: 5,
        title: 'vacuum',
        description: 'clean the floor with the vacuum',
        points: new Point(value: 125)));
  }
}
