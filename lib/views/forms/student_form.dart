import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário do Aluno A+'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              _form.currentState?.save();
              Navigator.of(context).pop();
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
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Senha'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nota 1'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nota 2'),
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
