import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bem vinda(o)'),
          centerTitle: true,
          backgroundColor: Color(0xFFFF9CE6),
          titleTextStyle: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF2D2D2D),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0),
          child: Center(
            child: Text(
              "PAGINA HOME DO APLICATIVO",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 64, fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ),
    );
  }
}
