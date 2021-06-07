import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotePage extends StatelessWidget {
  NotePage({Key? key, required this.aluno}) : super(key: key);
  Map aluno;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(aluno['nome']),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 200,
              child: TextButton(
                child: Text(
                  "Nota 1: " + aluno['n1'].toString(),
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 100,
              width: 200,
              child: TextButton(
                child: Text(
                  "Nota 2: " + aluno['n2'].toString(),
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 150,
              width: 350,
              child: TextButton(
                child: Text(
                  "Média: " + ((aluno['n1'] + aluno['n2']) / 2).toString(),
                  style: TextStyle(fontSize: 24),
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
