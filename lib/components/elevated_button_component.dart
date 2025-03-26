import 'package:flutter/material.dart';

class ElevatedButtonComponent extends StatelessWidget {
  final String text;
  final Color bgcolor;
  final Color textColor;
  final VoidCallback onPressed;

  const ElevatedButtonComponent({
    super.key,
    required this.text,
    required this.bgcolor,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
