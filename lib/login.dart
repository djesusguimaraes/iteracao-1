import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grades/home.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:validadores/Validador.dart';

import 'view_grade.dart';
import 'database.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _key = new GlobalKey();
  late String _email, _password;
  late Database db;
  final auth = FirebaseAuth.instance;
  List docs = [], docsp = [];

  initialise() {
    db = Database();
    db.initiliase();
    db.read().then((value) => {
          setState(() {
            docs = value;
          })
        });
  }

  initialisep() {
    db = Database();
    db.initiliase();
    db.readp().then((dado) => {
          setState(() {
            docsp = dado;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    initialise();
    initialisep();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.all(50),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                height: 128,
                width: 128,
              ),
              SizedBox(height: 40),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  return Validador()
                      .add(Validar.EMAIL, msg: 'Email Inválido')
                      .valido(value, clearNoNumber: false);
                },
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value!.length < 5 || value.isEmpty) {
                    return 'Senha Inválida';
                  }
                },
                onChanged: (value) {
                  setState(() {
                    _password = value.trim();
                  });
                },
              ),
              SizedBox(height: 40),
              ElevatedButton(
                child: Text('Signin'),
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    _key.currentState!.save();
                    for (var index = 0; index < docs.length; index++) {
                      if (docs[index]['email'] == _email) {
                        if (docs[index]['senha'] == _password) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotePage(
                                        aluno: docs[index],
                                        key: UniqueKey(),
                                      ))).then(
                            (value) => {
                              if (value != null) {initialise()}
                            },
                          );
                          return;
                        }
                      }
                    }
                    for (var index = 0; index < docsp.length; index++) {
                      if (docsp[index]['email'] == _email) {
                        if (docsp[index]['senha'] == _password) {
                          Navigator.of(context).pushReplacementNamed('/home');
                          return;
                        }
                      }
                    }
                    _loginAlert();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _loginAlert() {
    AlertDialog teste = AlertDialog(
      title: Text('Alerta'),
      content: Text('Email ou Senha invalidos'),
      actions: <Widget>[
        ElevatedButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return teste;
      },
    );
  }
}
