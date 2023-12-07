import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:uuid/uuid.dart';

class NyloStateNameWithLocalStorage extends StatefulWidget {
  NyloStateNameWithLocalStorage({
    Key? key,
    required this.getCounter,
    required this.setCounter,
  }) : super(key: key);

  final Future<int> Function() getCounter;
  final Future<void> Function(int) setCounter;

  // Unique identifier for the state management
  static String state = Uuid().v4();

  @override
  _NyloStateNameWithLocalStorageState createState() =>
      _NyloStateNameWithLocalStorageState();
}

class _NyloStateNameWithLocalStorageState
    extends NyState<NyloStateNameWithLocalStorage> {
  // Setting the unique identifier state management
  _NyloStateNameWithLocalStorageState() {
    stateName = NyloStateNameWithLocalStorage.state;
  }

  late int _counter;

  @override
  boot() async {
    _counter = await widget.getCounter.call();
  }

  @override
  void stateUpdated(data) {
    reboot();
  }

  _updateStateWidgetCounter() async {
    // Update the widget counter
    await widget.setCounter(_counter + 1);
    // Update Widget State
    updateState(NyloStateNameWithLocalStorage.state);
  }

  @override
  Widget build(BuildContext context) {
    return afterLoad(
      child: () => Column(
        children: [
          Badge(
            child: Icon(Icons.shopping_cart),
            label: Text(_counter.toString()),
          ),
          ElevatedButton(
            onPressed: _updateStateWidgetCounter,
            child: Text(NyloStateNameWithLocalStorage.state),
          ),
        ],
      ),
    );
  }
}
