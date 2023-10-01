import 'package:flutter/material.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/app.absolut_paths.routes.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/navigation_manager.dart';

class FindEventPage extends StatelessWidget {
  const FindEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Event Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            NavigationManager.navigate(AppAbsolutPathsRoutes.findPersonDetails);
          },
          child: const Text('Navigate to "Find Person Page 2"'),
        ),
      ),
    );
  }
}
