import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:uuid/uuid.dart';

class SettingsField extends StatefulWidget {
  SettingsField({
    Key? key,
    required this.getCounter,
    required this.setCounter,
  }) : super(key: key);

  final Future<bool> Function() getCounter;
  final Future<void> Function(bool) setCounter;

  // Unique identifier for the state management
  static String state = Uuid().v4();

  @override
  _SettingsFieldState createState() => _SettingsFieldState();
}

class _SettingsFieldState extends NyState<SettingsField> {
  // Setting the unique identifier state management
  _SettingsFieldState() {
    stateName = SettingsField.state;
  }

  late bool _value;

  @override
  boot() async {
    _value = await widget.getCounter.call();
  }

  @override
  void stateUpdated(data) {
    reboot();
  }

  _updateStateWidgetCounter(bool value) async {
    // Update the widget counter
    await widget.setCounter(value);
    // Update Widget State
    updateState(SettingsField.state);
  }

  @override
  Widget build(BuildContext context) {
    return afterLoad(
      child: () => Column(
        children: [
          Switch(value: _value, onChanged: _updateStateWidgetCounter),
          Badge(
            child: Icon(Icons.shopping_cart),
            label: Text(_value.toString()),
          ),
          // ElevatedButton(
          //   onPressed: _updateStateWidgetCounter,
          //   child: Text(SettingsField.state),
          // ),
        ],
      ),
    );
  }
}
