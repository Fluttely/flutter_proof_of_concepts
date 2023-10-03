import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(
    ModularApp(
      module: AppModule(),
      child: AppWidget(),
    ),
  );
}

class AppWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Modular Nested Navigation POC',
      routerConfig: Modular.routerConfig,
    );
  }
}

class AppModule extends Module {
  void routes(r) {
    r.child('/', child: (context) => AppRoot(), children: [
      ModuleRoute('/find', module: FindModule()),
      ModuleRoute('/profile', module: ProfileModule()),
    ]);
  }
}

class FindModule extends Module {
  void routes(r) {
    r.child('/', child: (context) => FindPage());
  }
}

class ProfileModule extends Module {
  void routes(r) {
    r.child('/', child: (context) => ProfilePage());
  }
}

class FindPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Find Page')),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Modular.to.navigate('/profile'); // Navigate to a nested screen
        },
        child: Text('Navigate to Profile Page'),
      )),
    );
  }
}

class ProfilePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Modular.to.navigate('/find'); // Navigate to a nested screen
          },
          child: Text('Navigate to Find Page'),
        ),
      ),
    );
  }
}

class AppRoot extends StatefulWidget {
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  int selectecIndex = 0;

  void onDestinationSelected(int index) {
    if (index == 0) {
      Modular.to.navigate('/find');
    } else {
      Modular.to.navigate('/profile');
    }
    setState(() {
      selectecIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: RouterOutlet(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectecIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Find',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_2),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}