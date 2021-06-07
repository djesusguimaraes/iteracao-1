import 'package:flutter/material.dart';
import 'package:validadores/Validador.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String? _password, _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        elevation: 0,
        title: Text(
          "G R A D E S",
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30),
        child: Form(
          key: _key,
          // ignore: deprecated_member_use
          autovalidate: _validate,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 128,
                width: 128,
                child: Image.asset("logo.png"),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) {
                  return Validador()
                      .add(Validar.EMAIL, msg: 'Email Inválido')
                      .add(Validar.OBRIGATORIO, msg: 'Campo obrigatório')
                      .minLength(0)
                      .maxLength(50)
                      .valido(value, clearNoNumber: false);
                },
                onSaved: (value) => _email = value!,
              ),
              SizedBox(height: 20),
              TextFormField(
                onSaved: (value) => _password = value!,
                obscureText: true,
                decoration: InputDecoration(labelText: "Senha"),
                validator: (value) {
                  return Validador()
                      .add(Validar.OBRIGATORIO, msg: 'Senha Inválida')
                      .valido(value, clearNoNumber: true);
                },
              ),
              SizedBox(height: 40),
              ElevatedButton.icon(
                icon: Icon(Icons.people_outline_rounded),
                label: Text("Login"),
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    _key.currentState!.save();
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













































//   Widget _formLogin() {
//     return 
//   }

//   _validateEmail(value) {
//     String pattern =
//         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//     RegExp regExp = new RegExp(pattern);
//     if (value.length == 0) {
//       return 'Informe o Email';
//     } else if (!regExp.hasMatch(value)) {
//       return 'Email inválido';
//     } else {
//       return null;
//     }
//   }

//   _validateSenha(value) {
//     if (value.trim().length == 0) {
//       return 'Informe o celular';
//     } else if (value.length < 4) {
//       return 'A senha deve ter no mínimo 4 digitos';
//     }
//     return null;
//   }

//   _sendForm() {
//     if (_key.currentState!.validate()) {
//       // Sem erros na validação
//       _key.currentState!.save();
//     } else {
//       // erro de validação
//       setState(() {
//         _validate = true;
//       });
//     }
//   }
// }
