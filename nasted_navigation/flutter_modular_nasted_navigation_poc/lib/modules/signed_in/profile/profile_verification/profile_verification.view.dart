import 'package:flutter/material.dart';

class ProfileVerificationView extends StatefulWidget {
  const ProfileVerificationView({super.key});

  @override
  State<ProfileVerificationView> createState() => _ProfileVerificationViewState();
}

abstract class ProfileEventViewViewModel extends State<ProfileVerificationView> {}

class _ProfileVerificationViewState extends ProfileEventViewViewModel {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Icon(Icons.verified));
  }
}
