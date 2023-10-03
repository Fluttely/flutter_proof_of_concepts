import 'package:flutter/material.dart';

class ProfileSettingsView extends StatefulWidget {
  const ProfileSettingsView({super.key});

  @override
  State<ProfileSettingsView> createState() => _ProfileSettingsViewState();
}

abstract class ProfilePersonViewViewModel extends State<ProfileSettingsView> {
  int indexPage = 0;
  int indexType = 0;
  int isCurrentItem = 0;
}

class _ProfileSettingsViewState extends ProfilePersonViewViewModel {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Icon(Icons.settings));
  }
}
