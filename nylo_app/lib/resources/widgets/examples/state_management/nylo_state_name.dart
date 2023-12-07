import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:uuid/uuid.dart';

class NyloStateName extends StatefulWidget {
  final String typeName;

  NyloStateName({
    Key? key,
    required this.typeName,
  }) : super(key: key);

  static String state = Uuid().v4();

  @override
  _NyloStateNameState createState() => _NyloStateNameState();
}

class _NyloStateNameState extends NyState<NyloStateName> {
  _NyloStateNameState() {
    stateName = NyloStateName.state;
  }

  int _widgetCounter = 0;

  _updateWidgetCounter() async {
    _widgetCounter++;
    updateState(NyloStateName.state);
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
