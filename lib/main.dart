import 'package:atividade/components/password_field_component.dart';
import 'package:atividade/components/text_field_component.dart';
import 'package:atividade/validators/form_field_validators.dart';
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

  Widget _buildElevatedButton(String text, Color BGcolor, Color textColor) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(BGcolor),
            fixedSize: WidgetStatePropertyAll(Size(350, 58)),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
          onPressed: null,
          child: Text(
            style: TextStyle(
              fontFamily: 'Inter',
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
            text,
          ),
        ),
      ),
    );
  }

  Widget _buildAvatarImage() {
    return CircleAvatar(
      radius: 75,
      backgroundImage: AssetImage('assets/avatar.png'),
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
              _buildElevatedButton('Entrar', Color(0xFF93C5FF), Colors.white),
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
              _buildElevatedButton(
                'Criar uma nova conta',
                Color(0xFFFF7D7D),
                Colors.white,
              ),
              SizedBox(height: 20),
              _buildElevatedButton(
                'Recuperar conta',
                Color(0xFFFFC081),
                Color(0xFF666666),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
