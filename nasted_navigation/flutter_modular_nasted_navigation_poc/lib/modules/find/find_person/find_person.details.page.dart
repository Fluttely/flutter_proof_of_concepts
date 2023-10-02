import 'package:flutter/material.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/app.routes.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/navigation_manager.dart';

class FindPersonDetailsPage extends StatelessWidget {
  const FindPersonDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Person Details Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            NavigationManager.navigate(AppRoutes.profileSettings);
          },
          child: const Text('Navigate to "profile Settings Page"'),
        ),
      ),
    );
  }
}
