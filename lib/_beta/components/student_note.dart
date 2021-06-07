import 'package:flutter/material.dart';

class NotePage extends StatelessWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Aluno Fulano de Tal"),
        centerTitle: true,
        toolbarHeight: 90,
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: [
            SizedBox(height: 50),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Nota 1: " + "\nNota 2: " + "\nMédia Final: ",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
