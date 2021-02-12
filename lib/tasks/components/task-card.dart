import 'package:flutter/material.dart';
import 'package:housework/tasks/components/description-panel.dart';

class TaskCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 5.0),
      child: DescriptionPanel(),
    );
  }
}
