import 'dart:html';
import 'dart:ui';

import 'package:app/entities/student.dart';
import 'package:app/views/lists/notes_list.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                obscureText: true,
                decoration: InputDecoration(labelText: "Nota 1"),
              ),
              SizedBox(height: 20),
              TextFormField(
                onSaved: (value) => _nota2 = value!,
                obscureText: true,
                decoration: InputDecoration(labelText: "Nota 2"),
              ),
              SizedBox(height: 40),
              ElevatedButton.icon(
                icon: Icon(Icons.save_outlined),
                label: Text("Save"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotesList(),
                      ),
                    );
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




















































































// import 'package:flutter/material.dart';

// var value = '';

// class RegisterPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "Registrar",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.black,
//       ),
//       body: Container(
//         padding: EdgeInsets.only(
//           top: 60,
//           right: 30,
//           bottom: 30,
//           left: 30,
//         ),
//         color: Colors.white,
//         child: ListView(
//           children: <Widget>[
//             SizedBox(
//               width: 56,
//               height: 56,
//               child: Image.asset("logo.png"),
//             ),
//             TextFormField(
//               autofocus: false,
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                 labelText: "Nome",
//                 labelStyle: TextStyle(
//                   color: Colors.black54,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),
//             TextFormField(
//               autofocus: false,
//               keyboardType: TextInputType.emailAddress,
//               // Label
//               decoration: InputDecoration(
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.black,
//                   ),
//                 ),
//                 labelText: "E-mail",
//                 labelStyle: TextStyle(
//                   color: Colors.black54,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),
//             TextField(
//               autofocus: false,
//               keyboardType: TextInputType.emailAddress,
//               obscureText: true,
//               // Label
//               decoration: InputDecoration(
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.black,
//                   ),
//                 ),
//                 labelText: "Senha",
//                 labelStyle: TextStyle(
//                   color: Colors.black54,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),
//             TextFormField(
//               autofocus: false,
//               keyboardType: TextInputType.emailAddress,
//               obscureText: true,
//               // Label
//               decoration: InputDecoration(
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.black,
//                   ),
//                 ),
//                 labelText: "Confirmação de Senha",
//                 labelStyle: TextStyle(
//                   color: Colors.black54,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),
//             Container(
//               height: 40,
//               child: ElevatedButton(
//                 child: Text(
//                   "Cadastrar",
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 onPressed: () {},
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
