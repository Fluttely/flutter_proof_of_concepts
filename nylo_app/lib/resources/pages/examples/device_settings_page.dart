import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:flutter/material.dart';
import 'package:updown_app/app/controllers/device_settings_controller.dart';
import 'package:updown_app/resources/widgets/device/settings/settings_field.dart';
import 'package:nylo_framework/nylo_framework.dart';

class DeviceSettingsPage extends NyStatefulWidget<DeviceSettingsController> {
  static const path = '/device-settings-page';

  DeviceSettingsPage() : super(path, child: _DeviceSettingsPagePageState());
}

class _DeviceSettingsPagePageState extends NyState<DeviceSettingsPage> {
  @override
  init() async {
    super.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings Page"),
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
            // NyloStateNameWithLocalStorage(
            //   getCounter: () async {
            //     await Future.delayed(Duration(milliseconds: 200));
            //     return await LocalStorageService.getInt(
            //             key: StorageKey.widgetCounterExample) ??
            //         0;
            //   },
            //   setCounter: (value) async {
            //     await Future.delayed(Duration(milliseconds: 100));
            //     return await LocalStorageService.setInt(
            //         key: StorageKey.widgetCounterExample, value: value);
            //   },
            // ),
            // Divider(),
            SettingsField(
              getCounter: widget.controller.getRampAdjustmentState,
              // () async {
              //   await Future.delayed(Duration(milliseconds: 200));
              //   return await LocalStorageService.getMap(
              //           key: 'StorageKey.widgetCounterExample') ??
              //       0;
              // },
              setCounter: widget.controller.setRampAdjustmentState,
            ),
          ],
        ),
      ),
    );
  }
}
