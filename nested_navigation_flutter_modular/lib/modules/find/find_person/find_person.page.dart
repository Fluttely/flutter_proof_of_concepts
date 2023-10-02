import 'package:flutter/material.dart';
import 'package:nested_navigation_flutter_modular/core/app.routes.dart';
import 'package:nested_navigation_flutter_modular/core/navigation_manager.dart';

class FindPersonPage extends StatelessWidget {
  const FindPersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Person Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            NavigationManager.pushNamed(
                AppRoutes.findPersonDetails);
          },
          child: const Text('Push to "Find Person Details Page"'),
        ),
      ),
    );
  }
}
