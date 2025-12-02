import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../drappers.dart';

class GuestHelper {
  static bool isGuest = false;

  static void checkGuest(BuildContext context) {
    if (isGuest) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("login Required"),
            content: Text("Please create an account to continue."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  isGuest = false;
                  context.goNamed(AppRoutes.loginScreen.name);
                },
                child: Text("Login in"),
              ),
            ],
          );
        },
      );
    }
  }
}
