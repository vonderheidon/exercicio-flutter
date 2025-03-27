import 'package:atividade/components/elevated_button_component.dart';
import 'package:atividade/components/password_field_component.dart';
import 'package:atividade/components/text_field_component.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercício',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Entrar na sua conta'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  Widget _buildAvatarImage() {
    return CircleAvatar(
      radius: 75,
      backgroundImage: AssetImage('assets/avatar.png'),
    );
  }

  Widget _loginErrorDialog() {
    return AlertDialog(
      title: Text('Falha de login'),
      content: Text('Email e/ou senha incorretos. Tente novamente.'),
      actions: <Widget>[
        TextButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF8F8F8),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(58),
          child: AppBar(
            title: Text(widget.title),
            backgroundColor: Color(0xFFFF9CE6),
            titleTextStyle: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF2D2D2D),
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAvatarImage(),
                SizedBox(height: 40),
                TextFieldComponent(
                  labelText: 'Digite seu email',
                  controller: _emailController,
                ),
                SizedBox(height: 20),
                PasswordFieldComponent(
                  labelText: 'Digite sua senha',
                  controller: _passwordController,
                ),
                SizedBox(height: 30),
                ElevatedButtonComponent(
                  text: 'Entrar',
                  bgcolor: Color(0xFF93C5FF),
                  textColor: Colors.white,
                  onPressed:
                      () => {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return _loginErrorDialog();
                          },
                        ),
                      },
                ),
                SizedBox(height: 20),
                Text(
                  'Ou',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButtonComponent(
                  text: 'Criar uma nova conta',
                  bgcolor: Color(0xFFFF7D7D),
                  textColor: Colors.white,
                  onPressed: () => {},
                ),
                SizedBox(height: 20),
                ElevatedButtonComponent(
                  text: 'Recuperar conta',
                  bgcolor: Color(0xFFFFC081),
                  textColor: Color(0xFF666666),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
