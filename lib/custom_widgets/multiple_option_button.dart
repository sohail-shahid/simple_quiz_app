import 'package:flutter/material.dart';

class MultipleOptionButton extends StatelessWidget {
  final String optionText;
  final void Function() onOptionSelect;
  const MultipleOptionButton(
      {super.key, required this.optionText, required this.onOptionSelect});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onOptionSelect,
      child: Text(
        optionText,
        style: const TextStyle(color: Colors.black),
        textAlign: TextAlign.center,
      ),
    );
  }
}
