import 'package:app/components/student_tile.dart';
import 'package:app/data/dummy_students.dart';
import 'package:flutter/material.dart';

class NotesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final students = {...DUMMY_STUDENTS};

    return Scaffold(
      appBar: AppBar(
        title: Text('Alunos da A+'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, i) => StudentTile(students.values.elementAt(i)),
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
