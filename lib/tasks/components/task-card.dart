import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:housework/tasks/components/description-panel.dart';
import 'package:housework/tasks/entities/task.dart';

class TaskCard extends StatelessWidget {
  Task task;

  TaskCard(Task task) {
    log('taskcard $task');
    this.task = task;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 5.0),
      child: DescriptionPanel(task: this.task),
    );
  }
}
