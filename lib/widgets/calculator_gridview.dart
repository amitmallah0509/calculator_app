import 'package:calculator_app/controllers/calculator_controller.dart';
import 'package:calculator_app/helper/constant.dart';
import 'package:calculator_app/helper/utilities.dart';
import 'package:calculator_app/models/calculator_model.dart';
import 'package:flutter/material.dart';

import 'calculator_button.dart';

class CalculatorGridview extends StatelessWidget {
  final List<String> buttons;
  final CalculatorController controller;

  const CalculatorGridview({
    Key? key,
    required this.buttons,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: buttons.length,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return clearButton(index);
          case 1:
            return bracketButton(index);
          case 16:
            return positiveNegativeButton(index);
          case 19:
            return equalButton(index);
          default:
            return CalculatorButton(
              buttontapped: () {
                getInputOffsetValue((offset) {
                  if (offset == -1) {
                    controller.calculatorInput.text += buttons[index];
                  } else {
                    controller.calculatorInput.text =
                        controller.calculatorInput.text.substring(0, offset) +
                            buttons[index] +
                            controller.calculatorInput.text.substring(offset);
                  }
                });
                /*
                final offset = controller.calculatorInput.selection.baseOffset;
                if (controller.calculatorInput.text.isEmpty || offset == -1) {
                  controller.calculatorInput.text += buttons[index];
                } else {
                  controller.calculatorInput.text =
                      controller.calculatorInput.text.substring(0, offset) +
                          buttons[index] +
                          controller.calculatorInput.text.substring(offset);
                  controller.calculatorInput.selection =
                      TextSelection.collapsed(offset: offset + 1);
                }
                */
              },
              buttonText: buttons[index],
              textColor: Utilities.to.isOperator(buttons[index])
                  ? Constant.buttonTextColor
                  : null,
            );
        }
      },
    );
  }

  getInputOffsetValue(Function(int) callback) {
    final offset = controller.calculatorInput.selection.baseOffset;
    if (controller.calculatorInput.text.isEmpty || offset == -1) {
      callback(-1);
    } else {
      callback(offset);
      controller.calculatorInput.selection =
          TextSelection.collapsed(offset: offset + 1);
    }
  }

  clearButton(int index) => CalculatorButton(
        buttontapped: () {
          controller.calculatorInput.text = '';
          controller.total.value = '0';
        },
        buttonText: buttons[index],
        textColor: Colors.red,
      );

  bracketButton(index) => CalculatorButton(
        buttontapped: () {
          getInputOffsetValue((offset) {
            int lastOpenBracketIndex = controller.calculatorInput.text
                .lastIndexOf('(', offset == -1 ? null : offset);
            int lastCloseBracketIndex = controller.calculatorInput.text
                .lastIndexOf(')', offset == -1 ? null : offset);
            bool hasOpenBracket =
                lastOpenBracketIndex != -1 && lastCloseBracketIndex == -1;
            if (lastCloseBracketIndex < lastOpenBracketIndex) {
              hasOpenBracket = true;
            }
            if (offset == -1) {
              controller.calculatorInput.text += hasOpenBracket ? ')' : '(';
            } else {
              controller.calculatorInput.text =
                  controller.calculatorInput.text.substring(0, offset) +
                      (hasOpenBracket ? ')' : '(') +
                      controller.calculatorInput.text.substring(offset);
            }
          });
        },
        buttonText: buttons[index],
        textColor: Constant.buttonTextColor,
      );

  positiveNegativeButton(int index) => CalculatorButton(
        buttonText: buttons[index],
        buttontapped: () {
          controller.calculatorInput.text = controller
              .positiveNegativeCalculation(controller.calculatorInput.text);
        },
      );

  equalButton(int index) => CalculatorButton(
        buttontapped: () async {
          controller.total.value =
              controller.equalCalculation(controller.calculatorInput.text);

          if (controller.total.value != '0' && controller.total.value != '') {
            var calculated = Calculator(
              calculateValue: controller.calculatorInput.text,
              total: controller.total.value,
            );

            int lastIndex = controller.calculatorBox.length;

            if (lastIndex == 0) {
              await controller.calculatorBox.add(calculated);
              return;
            }

            Calculator? lastCalculated =
                controller.calculatorBox.getAt(lastIndex - 1);

            if (controller.total.value != lastCalculated?.total) {
              await controller.calculatorBox.add(calculated);
            }
          }
        },
        buttonText: buttons[index],
        color: Constant.buttonTextColor,
        textColor: Colors.white,
      );
}
