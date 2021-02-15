

import 'package:flutter/cupertino.dart';
import 'package:housework/valueobjects/point.dart';

class Task {
  int id;
  String title;
  String description;
  Point points;

  Task({@required this.id,@required  this.title, @required this.description, @required this.points});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['name'],
      description: json['description'],
      points: Point.fromJson(json['point']),
    );
  }
}
