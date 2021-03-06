import 'package:flutter/material.dart';

import './tasks.dart';
import './task_control.dart';

class TaskManager extends StatefulWidget {
  final String startingTask;

  TaskManager ({this.startingTask});
  @override
  State<StatefulWidget> createState() {
    return _TaskManagerState();
  }
}

class _TaskManagerState extends State<TaskManager> {
  List<String> _tasks = [];

  @override
  void initState() {
    super.initState();
    if (widget.startingTask != null) {
      _tasks.add(widget.startingTask);
    }
  }

  void _addTasks (String task) {
    setState(() {
      _tasks.add(task);
    });
  }

  void _deleteTask (int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ 
        Container (
          margin: EdgeInsets.all(10.0),
          child: TaskControl(_addTasks),
        ),
        Expanded (
          child: Tasks(_tasks, deleteTask: _deleteTask))
      ]
    );
  }
}
