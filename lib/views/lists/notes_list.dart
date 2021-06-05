import 'package:app/components/student_tile.dart';
import 'package:app/provider/students.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users students = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Alunos da A+'),
      ),
      body: ListView.builder(
        itemCount: students.count,
        itemBuilder: (context, i) => StudentTile(students.all.elementAt(i)),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed('/register');
          },
          backgroundColor: Colors.blueGrey[900]),
    );
  }
}
