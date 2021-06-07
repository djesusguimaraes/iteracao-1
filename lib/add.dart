import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:validadores/Validador.dart';
import 'database.dart';

// ignore: must_be_immutable
class Add extends StatefulWidget {
  Add({Key? key, required this.db}) : super(key: key);
  Database db;
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController nomeController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController senhaController = new TextEditingController();
  TextEditingController senhaconfController = new TextEditingController();
  TextEditingController n1Controller = new TextEditingController();
  TextEditingController n2Controller = new TextEditingController();
  GlobalKey<FormState> _key = new GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Aluno"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                decoration: inputDecoration("Nome"),
                controller: nomeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo Obrigatório';
                  }
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: inputDecoration("Email"),
                controller: emailController,
                validator: (value) {
                  Validador()
                      .add(Validar.EMAIL, msg: "Email Inválido")
                      .valido(value, clearNoNumber: false);
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: inputDecoration("Senha"),
                controller: senhaController,
                validator: (value) {
                  Validador()
                      .add(Validar.OBRIGATORIO, msg: "Campo Obrigatório")
                      .valido(value, clearNoNumber: false);
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: inputDecoration("Confirmar Senha"),
                controller: senhaconfController,
                validator: (value) {
                  if (senhaController.text != senhaconfController.text) {
                    return 'Senhas não conferem';
                  }
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: inputDecoration("Nota 1"),
                controller: n1Controller,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: inputDecoration("Nota 2"),
                controller: n2Controller,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('dsadsadasdsa');
          if (_key.currentState!.validate()) {
            print('dsadsadasdsa');
            widget.db.create(
              emailController.text,
              nomeController.text,
              senhaController.text,
              double.parse(n1Controller.text),
              double.parse(n2Controller.text),
            );

            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Dados Salvos')));
            Navigator.pop(context, true);
          }
        },
        child: Icon(Icons.save_alt_outlined),
      ),
    );
  }

  InputDecoration inputDecoration(String labelText) {
    return InputDecoration(
      labelStyle: TextStyle(color: Colors.teal),
      labelText: labelText,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: Colors.teal.shade400),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          width: .9,
        ),
      ),
    );
  }
}
