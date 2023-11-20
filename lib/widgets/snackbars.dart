import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/utils/colors.dart';

class Snackbars {
  Snackbars._();

  static void standardSnackbar(String title, String message, {Widget? icon}) {
    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      backgroundColor: VColor.dark,
      icon: icon,
    );
  }

  static void successSnackbar(String title, String message) {
    standardSnackbar(
      title,
      message,
      icon: const Icon(
        Icons.check_circle_outline_rounded,
        color: Colors.white,
      ),
    );
  }

  static void warningSnackbar(String title, String message) {
    standardSnackbar(
      title,
      message,
      icon: const Icon(
        Icons.warning_amber_rounded,
        color: Colors.white,
      ),
    );
  }
}
