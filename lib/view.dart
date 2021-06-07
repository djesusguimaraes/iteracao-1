import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:validadores/Validador.dart';
import 'database.dart';

class View extends StatefulWidget {
  View({required Key key, required this.aluno, required this.db})
      : super(key: key);
  Map aluno;
  Database db;
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
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
    print(widget.aluno);
    nomeController.text = widget.aluno['nome'];
    emailController.text = widget.aluno['email'];
    senhaController.text = widget.aluno['senha'];
    n1Controller.text = widget.aluno['n1'].toString();
    n2Controller.text = widget.aluno['n2'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aluno"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              widget.db.delete(widget.aluno["id"]);
              Navigator.pop(context, true);
            },
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          top: 20,
          right: 40,
          bottom: 0,
          left: 40,
        ),
        child: Form(
          key: _key,
          child: Container(
            padding: EdgeInsets.all(20),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_key.currentState!.validate()) {
            widget.db.update(
                widget.aluno['id'],
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
