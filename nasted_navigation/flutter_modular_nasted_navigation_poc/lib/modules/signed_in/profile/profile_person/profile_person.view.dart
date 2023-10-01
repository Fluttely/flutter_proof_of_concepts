import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/app.routes.dart';

class ProfilePersonView extends StatefulWidget {
  const ProfilePersonView({super.key});

  @override
  State<ProfilePersonView> createState() => _ProfilePersonViewState();
}

abstract class ProfilePersonViewViewModel extends State<ProfilePersonView> {
  int indexPage = 0;
  int indexType = 0;
  int isCurrentItem = 0;
}

class _ProfilePersonViewState extends ProfilePersonViewViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Modular.to.navigate(AppRoutes.findEventAbsolutPath);
          },
          child: const Text('Navigate to Find Event Page'),
        ),
      ),
    );
  }
}
