import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UIHelper {
  static showSnackBar(String? message) {
    if (message == null || message.isEmpty) return;
    final isOpen = Get.isSnackbarOpen;
    if (isOpen) Get.back();
    Get.snackbar(
      "",
      "",
      snackPosition: SnackPosition.BOTTOM,
      padding: const EdgeInsets.only(bottom: 20),
      duration: const Duration(seconds: 3),
      backgroundColor: Theme.of(Get.context!).colorScheme.primaryVariant,
      messageText: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(color: Theme.of(Get.context!).colorScheme.onPrimary),
      ),
    );
  }

  static showErrorSnackBar(String? message) {
    if (message == null || message.isEmpty) return;
    final isOpen = Get.isSnackbarOpen;
    if (isOpen) Get.back();
    Get.snackbar(
      "",
      "",
      snackPosition: SnackPosition.BOTTOM,
      padding: const EdgeInsets.only(bottom: 20),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red[900],
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
