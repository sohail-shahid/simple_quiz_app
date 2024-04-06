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
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.white),
      ),
      child: Text(
        optionText,
        style: const TextStyle(
          color: Color.fromARGB(132, 52, 48, 48),
          fontSize: 14,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
