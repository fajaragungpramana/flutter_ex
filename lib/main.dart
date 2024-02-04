import 'package:flutter/material.dart';
import 'package:flutter_ex/app.dart';
import 'package:flutter_ex/core/data/local/constant/local_constant.dart';
import 'package:flutter_ex/di/app_module.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(LocalConstant.database);

  AppModule.onInit();

  return runApp(const App());
}
