import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:flutter/material.dart';
import 'package:updown_app/app/controllers/profile_controller.dart';
import 'package:updown_app/app/services/local_storage_service.dart';
import 'package:updown_app/config/storage_keys.dart';
import 'package:updown_app/resources/widgets/examples/state_management/nylo_state_name.dart';
import 'package:updown_app/resources/widgets/examples/state_management/nylo_state_name_with_local_storage.dart';
import 'package:updown_app/resources/widgets/examples/state_management/observer.dart';
import 'package:updown_app/resources/widgets/examples/state_management/set_state.dart';
import 'package:nylo_framework/nylo_framework.dart';

class StateManagementExamplePage
    extends NyStatefulWidget<StateManagementExampleController> {
  static const path = '/state-management-example-page';

  StateManagementExamplePage()
      : super(path, child: _StateManagementExamplePagePageState());
}

class _StateManagementExamplePagePageState
    extends NyState<StateManagementExamplePage> {
  @override
  init() {
    return super.init();
  }

  @override
  boot() async {
    await Future.delayed(Duration(seconds: 1));
    print('After 2 seconds...');
  }

  int _pageCounter = 0;

  _updatePageCounter() {
    _pageCounter++;
    // to update the state use: setState(() {});
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Management Example"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed:
                reboot, // refreshes the page. The `boot` method will be called again
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter: " + _pageCounter.toString()),
            ElevatedButton(
              onPressed: _updatePageCounter,
              child: Text('PageCounter'),
            ),
            Divider(),
            NyloStateNameWithLocalStorage(
              getCounter: () async {
                await Future.delayed(Duration(milliseconds: 200));
                return await LocalStorageService.getInt(
                        key: StorageKey.widgetCounterExample) ??
                    0;
              },
              setCounter: (value) async {
                await Future.delayed(Duration(milliseconds: 100));
                return await LocalStorageService.setInt(
                    key: StorageKey.widgetCounterExample, value: value);
              },
            ),
            Divider(),
            NyloStateNameWithLocalStorage(
              getCounter: () async {
                await Future.delayed(Duration(milliseconds: 200));
                return await LocalStorageService.getInt(
                        key: 'StorageKey.widgetCounterExample') ??
                    0;
              },
              setCounter: (value) async {
                await Future.delayed(Duration(milliseconds: 100));
                return await LocalStorageService.setInt(
                    key: 'StorageKey.widgetCounterExample', value: value);
              },
            ),
            Divider(),
            SetState(typeName: 'SetState'),
            Divider(),
            Observer(typeName: 'Observer'),
            Divider(),
            NyloStateName(typeName: 'NyloStateName'),
            Divider(),
            NyloStateName(typeName: 'NyloStateName'),
          ],
        ),
      ),
    );
  }
}
