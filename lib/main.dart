import 'dart:io';

import 'package:calculator_app/pages/calculator_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'controllers/calculator_controller.dart';
import 'helper/constant.dart';
import 'helper/theme.dart';
import 'models/calculator_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory appDir = await getApplicationDocumentsDirectory();

  Hive.init(appDir.path);
  Hive.registerAdapter(CalculatorAdapter());
  await Hive.openBox<Calculator>(Constant.calculatorBoxKey);

  Get.lazyPut(() => CalculatorController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorPage(),
      theme: Themes.light,
      darkTheme: Themes.dark,
    );
  }
}
