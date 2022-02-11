import 'package:flutter/material.dart';

class SplashViewModel extends ChangeNotifier {
  Future<void> initializeSplash(BuildContext context) async {
    Future<void>.delayed(
      const Duration(milliseconds: 3000),
      () async {
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/home",
          (route) => false,
        );
      },
    );
  }
}