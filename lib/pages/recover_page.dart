import 'package:atividade/components/elevated_button_component.dart';
import 'package:atividade/components/text_field_component.dart';
import 'package:flutter/material.dart';

class RecoverPage extends StatelessWidget {
  const RecoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          backgroundColor: Color(0xFFFF9CE6),
          title: Text('Recuperar conta'),
          titleSpacing: -15,
          titleTextStyle: TextStyle(color: Color(0xFF2D2D2D)),
        ),
        body: Column(
          children: [
            SizedBox(height: 20),
            TextFieldComponent(
              labelText: 'Digite seu email',
              prefixIcon: Icon(Icons.alternate_email),
            ),
            SizedBox(height: 20),
            TextFieldComponent(
              labelText: 'Digite seu cpf',
              prefixIcon: Icon(Icons.badge),
            ),
            SizedBox(height: 20),
            ElevatedButtonComponent(
              text: 'Recuperar Senha',
              bgcolor: Color(0xFF93C5FF),
              textColor: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
