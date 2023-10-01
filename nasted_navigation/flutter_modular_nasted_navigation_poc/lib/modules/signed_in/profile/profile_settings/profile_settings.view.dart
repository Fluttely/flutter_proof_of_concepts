import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/app.routes.dart';

class ProfileSettingsView extends StatefulWidget {
  const ProfileSettingsView({super.key});

  @override
  State<ProfileSettingsView> createState() => _ProfileSettingsViewState();
}

abstract class ProfilePersonViewViewModel extends State<ProfileSettingsView> {
  int indexPage = 0;
  int indexType = 0;
  int isCurrentItem = 0;
}

class _ProfileSettingsViewState extends ProfilePersonViewViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Modular.to.navigate(AppRoutes.findPersonAbsolutPath);
          },
          child: const Text('Navigate to Find People Page'),
        ),
      ),
    );
  }
}
