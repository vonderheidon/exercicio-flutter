import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  final String labelText;
  final Icon? prefixIcon;
  final String? errorText;
  final TextEditingController? controller;

  const TextFieldComponent({
    super.key,
    required this.labelText,
    this.prefixIcon,
    this.errorText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          errorText: errorText,
          filled: true,
          fillColor: Color(0xFFFFFFFF),
          labelText: labelText,
          labelStyle: TextStyle(color: Color(0xFFB4B4B4)),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFB4B4B4), width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFB4B4B4), width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFB4B4B4), width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
