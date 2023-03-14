import 'package:calculator_app/helper/constant.dart';
import 'package:calculator_app/helper/utilities.dart';
import 'package:calculator_app/models/calculator_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  final TextEditingController calculatorInput = TextEditingController(text: '');
  final RxString total = ''.obs;
  final RxBool showHistory = false.obs;

  final Box<Calculator> calculatorBox =
      Hive.box<Calculator>(Constant.calculatorBoxKey);

  String equalCalculation(String data) {
    try {
      String value = data.replaceAll('x', '*').replaceAll("%", "/100");

      Parser p = Parser();
      Expression exp = p.parse(value);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      return Utilities.to.removeTrailingZero(eval.toStringAsFixed(2));
    } catch (e) {
      // ignore: avoid_print
      Get.snackbar('Error', 'Invalid Format!');
      return '0';
    }
  }

  String positiveNegativeCalculation(String data) {
    int lastOperatorIndex = data.lastIndexOf(Constant.operatorRegex);
    if (lastOperatorIndex > 0) {
      if (data.contains("(-")) {
        int lastNegetiveIndex = data.lastIndexOf("(-");
        data = data.substring(
              0,
              lastNegetiveIndex,
            ) +
            data.substring(
              lastNegetiveIndex + 2,
              data.length - 1,
            );
      } else {
        data = data.substring(0, lastOperatorIndex + 1) +
            "(-" +
            data.substring(lastOperatorIndex + 1) +
            ")";
      }
    } else {
      if (data.startsWith("-")) {
        data = data.substring(1);
      } else {
        data = "-" + data;
      }
    }
    return data;
  }
}
