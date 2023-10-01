import 'package:flutter/material.dart';

class ProfileEventView extends StatefulWidget {
  const ProfileEventView({super.key});

  @override
  State<ProfileEventView> createState() => _ProfileEventViewState();
}

abstract class ProfileEventViewViewModel extends State<ProfileEventView> {}

class _ProfileEventViewState extends ProfileEventViewViewModel {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Icon(Icons.event_note));
  }
}
