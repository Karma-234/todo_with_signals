import 'package:flutter/material.dart';

class TododInputField extends StatelessWidget {
  const TododInputField({super.key, this.onChanged, this.hint = 'Hint...'});
  final Function(String)? onChanged;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        color: Colors.grey.shade300,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
              enabledBorder: InputBorder.none),
        ),
      ),
    );
  }
}
