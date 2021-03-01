import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housework/tasks/components/add-task-dialog.dart';
import 'package:housework/tasks/entities/task.dart';
import 'package:http/http.dart' as http;
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

import 'components/task-card.dart';

class TasksPage extends StatefulWidget {
  TasksPage({Key key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TasksPage> {
  List<Task> websocketTasks;

  @override
  void initState() {
    super.initState();
    websocketTasks = [];
    connectToWebsocket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                for (var task in websocketTasks) TaskCard(task),
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
        ));
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

  void connectToWebsocket() async {
    StompClient stompClient = StompClient(
        config: StompConfig(
            url: 'ws://192.168.178.44:8080/ws-endpoint',
            onConnect: onConnectCallback,
            onWebSocketError: (dynamic error) => log(error.toString())));

    stompClient.activate();
  }

  onConnectCallback(StompClient client, StompFrame frame) {
    client.subscribe(
        destination: '/app/task',
        callback: (StompFrame frame) {
          List<dynamic> result = json.decode(frame.body);
          setState(() {
            websocketTasks = result.map((task) => Task.fromJson(task)).toList();
          });
        });
  }
}
