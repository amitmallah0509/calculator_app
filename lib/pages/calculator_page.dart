import 'package:calculator_app/controllers/calculator_controller.dart';
import 'package:calculator_app/widgets/calculator_gridview.dart';
import 'package:calculator_app/widgets/calculator_history.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class CalculatorPage extends GetView<CalculatorController> {
  CalculatorPage({Key? key}) : super(key: key);

  final List<String> buttons = [
    'C',
    '( )',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '+/-',
    '0',
    '.',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: <Widget>[
            const SizedBox(height: 30),
            ...topSection(controller),
            const Divider(height: 15, indent: 15, endIndent: 15),
            Expanded(
              child: ObxValue<RxBool>(
                (showHistory) => showHistory.value
                    ? CalculatorHistory(controller: controller)
                    : CalculatorGridview(
                        buttons: buttons,
                        controller: controller,
                      ),
                controller.showHistory,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> topSection(controller) => [
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerRight,
          child: TextFormField(
            autofocus: true,
            controller: controller.calculatorInput,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 24, letterSpacing: 2.0),
            keyboardType: TextInputType.none,
            showCursor: false,
            maxLines: 3,
            decoration: const InputDecoration(border: InputBorder.none),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerRight,
          child: Obx(
            () => Text(
              controller.total.value,
              style: TextStyle(
                fontSize: 30,
                color: Colors.green.shade300,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Row(
          children: [
            const SizedBox(width: 10),
            Obx(
              () => IconButton(
                onPressed: () {
                  controller.showHistory.value = !controller.showHistory.value;
                },
                color: Colors.blue.shade50,
                icon: Icon(
                  Icons.history,
                  size: 30,
                  color: controller.showHistory.value
                      ? Colors.blue
                      : Colors.blueGrey,
                ),
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                if (controller.calculatorInput.text == '') return;
                if (controller.calculatorInput.text.length == 1) {
                  controller.total.value = '0';
                }
                controller.calculatorInput.text = controller
                    .calculatorInput.text
                    .substring(0, controller.calculatorInput.text.length - 1);
              },
              color: Colors.blue.shade50,
              icon: const Icon(Icons.disabled_by_default_outlined,
                  size: 30, color: Colors.redAccent),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ];
}
