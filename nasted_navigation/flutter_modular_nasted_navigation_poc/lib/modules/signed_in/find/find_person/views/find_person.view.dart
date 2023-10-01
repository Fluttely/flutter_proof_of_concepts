import 'package:flutter/material.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/app.absolut_paths.routes.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/navigation_manager.dart';

class FindPersonView extends StatefulWidget {
  const FindPersonView({super.key});

  @override
  State<FindPersonView> createState() => _FindPersonViewState();
}

abstract class FindPersonViewViewModel extends State<FindPersonView> {
  int indexPage = 0;
  int indexType = 0;
  int isCurrentItem = 0;
}

class _FindPersonViewState extends FindPersonViewViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Find Page 1'),
            ElevatedButton(
              onPressed: () {
                NavigationManager.pushNamed(
                    AppAbsolutPathsRoutes.findPersonDetails);
              },
              child: const Text('Go to Find Page 2'),
            ),
          ],
        ),
      ),
    );
  }
}
