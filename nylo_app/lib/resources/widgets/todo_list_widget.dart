import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:uuid/uuid.dart';

class TodoList extends StatefulWidget {
  TodoList({Key? key}) : super(key: key);

  static String state = Uuid().v4();

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends NyState<TodoList> {
  _TodoListState() {
    stateName = TodoList.state;
  }

  @override
  init() async {
    super.init();
  }

  @override
  stateUpdated(dynamic data) async {
    // e.g. to update this state from another class
    // updateState(TodoList.state, data: "example payload");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // child: Text(count),
        );
  }
}
