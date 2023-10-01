import 'package:flutter/material.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/app.absolut_paths.routes.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/navigation_manager.dart';

class FindPersonPage1 extends StatelessWidget {
  const FindPersonPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Person Page 1'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            NavigationManager.pushNamed(
                AppAbsolutPathsRoutes.findPersonDetails);
          },
          child: const Text('Push to "Find Person Page 2"'),
        ),
      ),
    );
  }
}
