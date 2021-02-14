import 'package:flutter/material.dart';
import 'package:housework/tasks/services/dummy-tasks-service.dart';

import 'components/task-card.dart';

class TasksPage extends StatelessWidget {
  final DummyTasksService tasksService;

  TasksPage(this.tasksService);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        for(var task in tasksService.tasks) TaskCard(task),

      ],
    );
  }
}