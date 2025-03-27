import 'package:flutter/material.dart';

class PasswordFieldComponent extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final Icon? prefixIcon;

  const PasswordFieldComponent({
    super.key,
    required this.labelText,
    required this.controller,
    this.prefixIcon,
  });

  @override
  State<PasswordFieldComponent> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordFieldComponent> {
  bool _visibilityPassword = true;

  void _toggleVisibilityPassword() {
    setState(() {
      _visibilityPassword = !_visibilityPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        obscureText: _visibilityPassword,
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          labelText: widget.labelText,
          labelStyle: TextStyle(color: Color(0xFFB4B4B4)),
          filled: true,
          fillColor: Color(0xFFFFFFFF),
          suffixIcon: IconButton(
            onPressed: _toggleVisibilityPassword,
            icon: Icon(
              _visibilityPassword ? Icons.visibility_off : Icons.visibility,
            ),
          ),
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
