import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:uuid/uuid.dart';

class Observer extends StatefulWidget {
  final String typeName;

  Observer({
    Key? key,
    required this.typeName,
  }) : super(key: key);

  static String state = Uuid().v4();

  @override
  _ObserverState createState() => _ObserverState();
}

class _ObserverState extends NyState<Observer> {
  ValueNotifier<int> _widgetCounter = ValueNotifier(0);

  _updateWidgetCounter() {
    _widgetCounter.value++;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder(
          valueListenable: _widgetCounter,
          builder: (_, value, ___) {
            return Badge(
              child: Icon(Icons.shopping_cart),
              label: Text(value.toString()),
            );
          },
        ),
        ElevatedButton(
          onPressed: _updateWidgetCounter,
          child: Text(widget.typeName),
        ),
      ],
    );
  }
}
