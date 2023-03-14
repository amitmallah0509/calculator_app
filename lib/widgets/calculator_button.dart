import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final String buttonText;
  final void Function()? buttontapped;

  const CalculatorButton({
    Key? key,
    this.color,
    this.textColor,
    required this.buttonText,
    this.buttontapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Container(
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: color ??
              Theme.of(context).buttonTheme.colorScheme?.background ??
              Colors.grey.shade100,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor ??
                  Theme.of(context).buttonTheme.colorScheme?.onPrimary ??
                  Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
