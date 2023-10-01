import 'package:flutter/material.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/app.absolut_paths.routes.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/navigation_manager.dart';

class FindPersonPage3 extends StatelessWidget {
  const FindPersonPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Person Page 3'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            NavigationManager.navigate(AppAbsolutPathsRoutes.profileSettings);
          },
          child: const Text('Navigate to "Profile Settings Page"'),
        ),
      ),
    );
  }
}
