import 'package:flutter/material.dart';

class NotificationsService {
  static late GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbarError(String message) {
    final snackbar = SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 2500),
      backgroundColor: Colors.red,
    );

    messengerKey.currentState!.showSnackBar(snackbar);
  }

  static showSnackbar(String message) {
    final snackbar = SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 2500),
      backgroundColor: Colors.green,
    );

    messengerKey.currentState!.showSnackBar(snackbar);
  }
}
