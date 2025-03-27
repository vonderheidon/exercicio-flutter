import 'package:atividade/components/elevated_button_component.dart';
import 'package:atividade/components/password_field_component.dart';
import 'package:atividade/components/text_field_component.dart';
import 'package:atividade/database/user_database.dart';
import 'package:atividade/validators/text_field_validators.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _validator = TextFieldValidators();
  final _userDataBase = UserDatabase();

  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _clearFields() {
    _emailController.clear();
    _cpfController.clear();
    _phoneController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }

  void validateFields() {
    if (!_validator.isValidEmail(_emailController.text)) {
      _showDialog('Formato inválido', 'Digite um email válido');
    } else if (!_validator.isValidCPF(_cpfController.text)) {
      _showDialog('Formato inválido', 'O CPF deve conter apenas números');
    } else if (_phoneController.text.isEmpty) {
      _showDialog('Erro', 'Preencha o campo de telefone');
    } else if (!_validator.isValidPassword(_passwordController.text)) {
      _showDialog('Erro', 'A senha deve ter no mínimo 8 caracteres');
    } else if (_passwordController.text != _confirmPasswordController.text) {
      _showDialog('Erro', 'As senhas digitadas não coincidem');
    } else {
      _userDataBase.addUser(
        _emailController.text,
        _cpfController.text,
        _phoneController.text,
        _passwordController.text,
      );

      _showDialog('Sucesso', 'Conta cadastrada com sucesso');
      _clearFields();
    }
  }

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
          title: Text('Criar uma nova conta', style: TextStyle(fontSize: 16)),
          titleSpacing: -15,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              TextFieldComponent(
                labelText: 'Digite seu email',
                prefixIcon: Icon(Icons.alternate_email),
                controller: _emailController,
              ),
              SizedBox(height: 20),
              TextFieldComponent(
                labelText: 'Digite seu cpf',
                prefixIcon: Icon(Icons.badge),
                controller: _cpfController,
              ),
              SizedBox(height: 20),
              TextFieldComponent(
                labelText: 'Digite seu telefone',
                prefixIcon: Icon(Icons.call),
                controller: _phoneController,
              ),
              SizedBox(height: 20),
              PasswordFieldComponent(
                labelText: 'Digite sua senha',
                prefixIcon: Icon(Icons.password),
                controller: _passwordController,
              ),
              SizedBox(height: 20),
              PasswordFieldComponent(
                labelText: 'Confirme sua senha',
                prefixIcon: Icon(Icons.password),
                controller: _confirmPasswordController,
              ),
              SizedBox(height: 20),
              ElevatedButtonComponent(
                text: 'Criar Conta e Entrar',
                bgcolor: Color(0xFF5CFFA6),
                textColor: Colors.white,
                onPressed: () {
                  validateFields();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
