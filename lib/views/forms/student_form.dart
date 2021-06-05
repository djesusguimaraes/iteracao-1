import 'package:app/entities/student.dart';
import 'package:app/provider/students.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário do Aluno A+'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState?.validate();

              if (isValid == true) {
                _form.currentState?.save();
                Provider.of<Students>(context).put(
                  Student(
                      id: _formData['id'],
                      name: _formData['name'],
                      email: _formData['email'],
                      password: _formData['password'],
                      n1: _formData['n1'],
                      n2: _formData['n2']),
                );
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Form(
              key: _form,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nome'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return ('Insira um nome válido');
                      }
                    },
                    onSaved: (value) => _formData['name'] = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return ('Insira um email válido');
                      }
                    },
                    onSaved: (value) => _formData['email'] = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Senha'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return ('Insira uma senha válida');
                      }
                    },
                    onSaved: (value) => _formData['password'] = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nota 1'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return ('Insira uma nota válida');
                      }
                    },
                    onSaved: (value) => _formData['n1'] = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nota 2'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return ('Insira uma nota válida');
                      }
                    },
                  ),
                ],
              ),
            ),
            /* Container(
              height: 40,
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [
                        0.3,
                        1
                      ],
                      colors: [
                        Colors.white,
                        Colors.black,
                      ]),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  )),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Salvar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(),
                    ],
                  ),
                  onPressed: () => {},
                ),
              ),
            ), */
          ],
        ),
      ),
    );
  }
}
