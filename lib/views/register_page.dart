import 'package:flutter/material.dart';

var value = '';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Registrar",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          right: 30,
          bottom: 30,
          left: 30,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 56,
              height: 56,
              child: Image.asset("logo.png"),
            ),
            TextFormField(
              autofocus: false,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Nome",
                labelStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 30),
            TextFormField(
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              // Label
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              // Label
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 30),
            TextFormField(
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              // Label
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                labelText: "Confirmação de Senha",
                labelStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 40,
              child: ElevatedButton(
                child: Text(
                  "Cadastrar",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
