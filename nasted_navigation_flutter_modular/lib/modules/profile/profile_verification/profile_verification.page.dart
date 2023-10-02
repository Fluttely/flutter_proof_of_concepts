import 'package:flutter/material.dart';
import 'package:nasted_navigation_flutter_modular/core/app.routes.dart';
import 'package:nasted_navigation_flutter_modular/core/navigation_manager.dart';

class ProfileVerificationPage extends StatelessWidget {
  const ProfileVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Veification Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            NavigationManager.navigate(AppRoutes.findEvent);
          },
          child: const Text('Navigate to "Find Event Page"'),
        ),
      ),
    );
  }
}
