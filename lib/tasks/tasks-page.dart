import 'package:flutter/material.dart';

import 'components/task-card.dart';

class TasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        TaskCard(),
      ],
    );
  }
}