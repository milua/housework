import 'package:flutter/cupertino.dart';

class TaskDto {
  String title;
  String description;
  int points;

  TaskDto(
      {@required this.title,
      @required this.description,
      @required this.points});

  factory TaskDto.fromJson(Map<String, dynamic> json) {
    return TaskDto(
      title: json['name'],
      description: json['description'],
      points: json['points'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': title,
        'description': description,
        'points': points,
      };
}
