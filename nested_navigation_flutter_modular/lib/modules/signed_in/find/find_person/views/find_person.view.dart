import 'package:flutter/material.dart';
import 'package:nested_navigation_flutter_modular/core/app.absolut_paths.routes.dart';
import 'package:nested_navigation_flutter_modular/core/match_buttons_area.dart';
import 'package:nested_navigation_flutter_modular/core/navigation_manager.dart';

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
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: const Alignment(0.0, 1),
                begin: const Alignment(0.0, -1),
                colors: <Color>[
                  Colors.red,
                  Colors.red.shade300,
                  Colors.white,
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            child: InkWell(
              onTap: () => NavigationManager.navigate(
                  AppAbsolutPathsRoutes.findPersonDetails),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(
                  'https://www.digitaletextil.com.br/blog/wp-content/uploads/2020/12/modelos-de-maio-corpo6.jpeg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          const MatchButtonsArea(),
        ],
      ),
    );
  }
}
