import 'dart:async';
import 'dart:developer';

import 'package:alumni/app/di.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() async {
  await initLocatorService();
  runZonedGuarded(
    () => runApp(const AlumniApp()),
    (error, stackTrace) => log(
      error.toString(),
      stackTrace: stackTrace,
    ),
  );
}
