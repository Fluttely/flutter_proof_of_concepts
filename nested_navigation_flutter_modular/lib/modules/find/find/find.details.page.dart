import 'package:flutter/material.dart';
import 'package:nested_navigation_flutter_modular/core/app.routes.dart';
import 'package:nested_navigation_flutter_modular/core/navigation.manager.dart';

class FindDetailsPage extends StatelessWidget {
  const FindDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Details Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            NavigationManager.navigate(AppRoutes.profile);
          },
          child: const Text('Navigate to "Profile Page"'),
        ),
      ),
    );
  }
}
