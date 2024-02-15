import 'package:flutter/material.dart';

List<Map<String, dynamic>> allTasks = [
  {"id":1,"title": "asad", "isChecked": false, "color": Colors.pink},
  {"id":2,"title": "aqwe", "isChecked": false, "color": Colors.lightGreen},
  {"id":3,"title": "jhgf", "isChecked": false, "color": Colors.pink},
  {"id":4,"title": "asad", "isChecked": false, "color": Colors.purple},
  {"id":5,"title": "aqwe", "isChecked": false, "color": Colors.lightGreen},
  {"id":6,"title": "jhgf", "isChecked": false, "color": Colors.pink},
  {"id":7,"title": "asad", "isChecked": false, "color": Colors.purple},
  {"id":8,"title": "aqwe", "isChecked": false, "color": Colors.lightGreen},
  {"id":9,"title": "jhgf", "isChecked": false, "color": Colors.pink},
];

class Task {
  late final String title;
  late final bool isChecked;
  Task(this.title, this.isChecked);
}
