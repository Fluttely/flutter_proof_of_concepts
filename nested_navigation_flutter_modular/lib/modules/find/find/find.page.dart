import 'package:flutter/material.dart';
import 'package:nested_navigation_flutter_modular/core/app.routes.dart';
import 'package:nested_navigation_flutter_modular/core/navigation.manager.dart';

class FindPage extends StatelessWidget {
  const FindPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            NavigationManager.pushNamed(
                AppRoutes.findDetails);
          },
          child: const Text('Push to "Find Details Page"'),
        ),
      ),
    );
  }
}
