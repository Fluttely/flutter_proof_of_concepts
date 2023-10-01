import 'package:flutter/material.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/app.absolut_paths.routes.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/navigation_manager.dart';

class FindPersonMatchView extends StatefulWidget {
  const FindPersonMatchView({super.key});

  @override
  State<FindPersonMatchView> createState() => _FindPersonMatchViewState();
}

abstract class FindPersonMatchViewViewModel
    extends State<FindPersonMatchView> {}

class _FindPersonMatchViewState extends FindPersonMatchViewViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Find Page 3'),
            ElevatedButton(
              onPressed: () {
                NavigationManager.navigate(
                    AppAbsolutPathsRoutes.profileSettings);
              },
              child: const Text('Navigate to Profile Setings Page'),
            ),
          ],
        ),
      ),
    );
  }
}
