import 'package:flutter/material.dart';
import 'package:housework/tasks/components/add-task-dialog.dart';
import 'package:housework/tasks/entities/task.dart';
import 'components/task-card.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class TasksPage extends StatefulWidget {
  TasksPage({Key key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TasksPage> {
  Future<List<Task>> futureTasks;

  @override
  void initState() {
    super.initState();
    futureTasks = fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Task>>(
        future: futureTasks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              body: Column(
                children: [
                  ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      for (var task in snapshot.data) TaskCard(task),
                    ],
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddTaskPage()));
                },
                child: Icon(Icons.add),
                backgroundColor: Colors.green,
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  Future<List<Task>> fetchTasks() async {
    final response = await http.get('http://192.168.178.44:8080/api/task/');

    if (response.statusCode == 200) {
      Iterable taskList = json.decode(response.body);
      return taskList.map((task) => Task.fromJson(task)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }
}
