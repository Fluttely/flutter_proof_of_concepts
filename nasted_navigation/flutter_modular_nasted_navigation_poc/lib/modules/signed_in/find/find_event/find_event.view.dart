import 'package:flutter/material.dart';

class FindEventView extends StatefulWidget {
  const FindEventView({super.key});

  @override
  State<FindEventView> createState() => _FindEventViewState();
}

abstract class FindEventViewViewModel extends State<FindEventView> {}

class _FindEventViewState extends FindEventViewViewModel {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Icon(Icons.event_note));
  }
}
