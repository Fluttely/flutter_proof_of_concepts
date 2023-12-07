import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:updown_app/resources/pages/examples/device_settings_page.dart';
import 'package:updown_app/resources/pages/examples/home_page.dart';
import '/app/controllers/main_controller.dart';

class MainPage extends NyStatefulWidget<MainController> {
  static const path = '/main';

  MainPage() : super(path, child: _MainPageState());
}

class _MainPageState extends NyState<MainPage> {
  @override
  init() async {
    super.init();
  }

  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: SafeArea(
        child: NySwitch(widgets: [
          DeviceSettingsPage(),
          HomePage(),
        ], indexSelected: _currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined), label: "Account"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex),
    );
  }
}
