import 'package:flutter/material.dart';
import 'package:shroominate/app.dart';
import 'dart:io';

import 'package:flutter/foundation.dart';
void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode)
      exit(1);
  };

  runApp(App());
}