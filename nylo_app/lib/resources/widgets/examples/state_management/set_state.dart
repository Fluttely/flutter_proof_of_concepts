import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:uuid/uuid.dart';

class SetState extends StatefulWidget {
  final String typeName;

  SetState({
    Key? key,
    required this.typeName,
  }) : super(key: key);

  static String state = Uuid().v4();

  @override
  _SetStateState createState() => _SetStateState();
}

class _SetStateState extends NyState<SetState> {
  int _widgetCounter = 0;

  _updateWidgetCounter() {
    _widgetCounter++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Badge(
          child: Icon(Icons.shopping_cart),
          label: Text(_widgetCounter.toString()),
        ),
        ElevatedButton(
          onPressed: _updateWidgetCounter,
          child: Text(widget.typeName),
        ),
      ],
    );
  }
}
