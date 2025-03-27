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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(bgcolor),
            fixedSize: WidgetStatePropertyAll(Size(350, 58)),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ), 
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Inter',
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          )
        ),
      ),
    );
  }
}
