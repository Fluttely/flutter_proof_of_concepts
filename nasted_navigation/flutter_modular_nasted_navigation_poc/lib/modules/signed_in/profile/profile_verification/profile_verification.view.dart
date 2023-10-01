import 'package:flutter/material.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/app.routes.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/navigation_manager.dart';

class ProfileVerificationView extends StatefulWidget {
  const ProfileVerificationView({super.key});

  @override
  State<ProfileVerificationView> createState() =>
      _ProfileVerificationViewState();
}

abstract class ProfileEventViewViewModel
    extends State<ProfileVerificationView> {
  @override
  void initState() {
    super.initState();
  }
}

class _ProfileVerificationViewState extends ProfileEventViewViewModel {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
          onPressed: () {
            NavigationManager.navigate(AppAbsolutPathsRoutes.findEvent);
          },
          child: const Text('Navigate to Find People Page'),
      ),
    );
  }
}
