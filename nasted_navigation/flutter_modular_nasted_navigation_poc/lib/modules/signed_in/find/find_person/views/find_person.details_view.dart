import 'package:flutter/material.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/app.absolut_paths.routes.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/navigation_manager.dart';

class FindPersonDetailsView extends StatefulWidget {
  const FindPersonDetailsView({super.key});

  @override
  State<FindPersonDetailsView> createState() => _FindPersonDetailsViewState();
}

abstract class FindPersonDetailsViewViewModel
    extends State<FindPersonDetailsView> {}

class _FindPersonDetailsViewState extends FindPersonDetailsViewViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Find Page 2'),
            ElevatedButton(
              onPressed: () {
                NavigationManager.pushNamed(
                    AppAbsolutPathsRoutes.findPersonMatch);
              },
              child: const Text('Go to Find Page 3'),
            ),
          ],
        ),
      ),
    );
  }
}
