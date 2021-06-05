import 'package:flutter/material.dart';
import 'package:validadores/Validador.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  String _nome = '';
  String _email = '';
  String _password = '';
  String _passconf = '';
  String nota_1 = '';
  String nota_2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrar"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: "Nome"),
                onSaved: (value) => _nome = value!,
                validator: (value) {
                  return Validador()
                      .add(Validar.OBRIGATORIO, msg: 'Campo Obrigatório')
                      .valido(value, clearNoNumber: true);
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                onSaved: (value) => _email = value!,
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) {
                  return Validador()
                      .add(Validar.EMAIL, msg: 'Email Inválido')
                      .valido(value, clearNoNumber: true);
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                onSaved: (value) => nota_1 = value!,
                decoration: InputDecoration(labelText: "Nota 1"),
                validator: (value) {
                  return Validador()
                      .add(Validar.OBRIGATORIO, msg: 'Campo Obrigatório')
                      .valido(value, clearNoNumber: true);
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                onSaved: (value) => nota_2 = value!,
                decoration: InputDecoration(labelText: "Nota 2"),
                validator: (value) {
                  return Validador()
                      .add(Validar.OBRIGATORIO, msg: 'Campo Obrigatório')
                      .valido(value, clearNoNumber: true);
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                onSaved: (value) => _password = value!,
                obscureText: true,
                decoration: InputDecoration(labelText: "Senha"),
                validator: (value) {
                  _password = value!;
                  return Validador()
                      .add(Validar.OBRIGATORIO, msg: 'Campo Obrigatório')
                      .valido(value, clearNoNumber: true);
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                onSaved: (value) => _passconf = value!,
                obscureText: true,
                decoration: InputDecoration(labelText: "Confirmação de Senha"),
                validator: (value) {
                  if (value != _password) {
                    return 'Senhas não conferem';
                  }
                },
              ),
              SizedBox(height: 40),
              ElevatedButton.icon(
                icon: Icon(Icons.save_outlined),
                label: Text("Save"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.of(context).pushReplacementNamed('/home');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
