import 'package:calculator_app/controllers/calculator_controller.dart';
import 'package:calculator_app/models/calculator_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CalculatorHistory extends StatelessWidget {
  final CalculatorController controller;

  CalculatorHistory({Key? key, required this.controller}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder(
          valueListenable: controller.calculatorBox.listenable(),
          builder: (context, Box<Calculator> box, _) {
            List<Calculator> data = box.values.toList().reversed.toList();

            return Expanded(
              child: ListView.separated(
                controller: _scrollController,
                separatorBuilder: (con, ind) =>
                    const Divider(color: Colors.transparent, height: 15),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: data.length,
                reverse: true,
                itemBuilder: (context, int index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      data[index].calculateValue,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "= " + data[index].total,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.green.shade300,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).buttonTheme.colorScheme?.background,
            borderRadius: BorderRadius.circular(50),
          ),
          child: TextButton(
            onPressed: () {
              controller.calculatorBox.clear();
              controller.showHistory.value = false;
            },
            child: const Text(
              'Clear History',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
