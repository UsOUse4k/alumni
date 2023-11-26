import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showErrorSnackBar(String message,BuildContext context) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.error(
      message: message,
      icon: const SizedBox(),
    ),
  );
}

void showSuccessSnackBar(String message,BuildContext context) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(
      message: message,
      icon: const SizedBox(),
    ),
  );
}

