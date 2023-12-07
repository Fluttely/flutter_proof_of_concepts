import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

class ThemeController {
  static final brightness = signal(Brightness.light);
  static final themeMode = computed(() {
    if (brightness() == Brightness.dark) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  });
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      themeMode: ThemeController.themeMode.watch(context),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final counter = signal<int>(0);

  void _incrementCounter() {
    counter.value++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Watch<IconButton>((_) {
            final isDark = ThemeController.brightness() == Brightness.dark;
            return IconButton(
              onPressed: () {
                ThemeController.brightness.value =
                    isDark ? Brightness.light : Brightness.dark;
              },
              icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            );
          }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Watch<Text>((context) {
              return Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.headlineMedium!,
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
