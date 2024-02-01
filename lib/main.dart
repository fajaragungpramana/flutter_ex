import 'package:flutter/material.dart';
import 'package:flutter_ex/app.dart';
import 'package:flutter_ex/constant/app_constant.dart';
import 'package:flutter_ex/di/di_module.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DiModule.onInit();
  await Hive.initFlutter();
  await Hive.openBox(AppConstant.hiveBoxCacheDatabase);

  return runApp(const App());
}
