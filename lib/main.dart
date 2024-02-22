import 'dart:async';
import 'dart:developer';

import 'package:alumni/app/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'app/app.dart';

void main() async {
  await initLocatorService();

  Bloc.observer = TalkerBlocObserver(talker: di<Talker>());

  runZonedGuarded(
    () => runApp(const AlumniApp()),
    (error, stackTrace) => log(
      error.toString(),
      stackTrace: stackTrace,
    ),
  );
}
