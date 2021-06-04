import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _formKey = GlobalKey<FormState>();

  String _nome = '';
  String _email = '';
  String _nota1 = '';
  String _nota2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text("Aluno"),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: "Nome"),
                onSaved: (value) => _nome = value!,
              ),
              SizedBox(height: 20),
              TextFormField(
                onSaved: (value) => _email = value!,
                decoration: InputDecoration(labelText: "Email"),
              ),
              SizedBox(height: 20),
              TextFormField(
                onSaved: (value) => _nota1 = value!,
                decoration: InputDecoration(labelText: "Nota 1"),
              ),
              SizedBox(height: 20),
              TextFormField(
                onSaved: (value) => _nota2 = value!,
                decoration: InputDecoration(labelText: "Nota 2"),
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
