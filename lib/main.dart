import 'package:flutter/material.dart';
import 'package:flutter_ex/app.dart';
import 'package:flutter_ex/di/di_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DiModule.onInit();

  return runApp(const App());
}
