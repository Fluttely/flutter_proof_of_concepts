import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/app.routes.dart';

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
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                end: Alignment(0.0, 1),
                begin: Alignment(0.0, -1),
                colors: <Color>[
                  Colors.redAccent,
                  Colors.redAccent,
                  Colors.white,
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            child: InkWell(
              onTap: () =>
                  Modular.to.navigate(AppRoutes.findPersonDetailsAbsolutPath),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(
                  'https://www.digitaletextil.com.br/blog/wp-content/uploads/2020/12/modelos-de-maio-corpo6.jpeg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 64,
                      width: 64,
                      margin: const EdgeInsets.fromLTRB(16, 16, 10, 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.close_rounded,
                          color: Colors.redAccent,
                          size: 28,
                        ),
                      ),
                    ),
                    Container(
                      height: 64,
                      width: 64,
                      margin: const EdgeInsets.fromLTRB(10, 16, 16, 16),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          end: Alignment(0.0, 0.4),
                          begin: Alignment(0.0, -1),
                          colors: <Color>[
                            Colors.redAccent,
                            Colors.redAccent,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {
                          Modular.to.navigate(AppRoutes.findPersonMatchAbsolutPath);
                        },
                        icon: const Icon(
                          Icons.favorite_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
