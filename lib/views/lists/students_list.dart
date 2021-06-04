import 'package:app/components/student_tile.dart';
import 'package:app/navigation/navigate_to.dart';
import 'package:app/provider/students.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/views/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Students students = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Alunos da A+'),
      ),
      body: ListView.builder(
        itemCount: students.count,
        itemBuilder: (ctx, i) => StudentTile(students.byIndex(i)),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(
              AppRoutes.STUDENT_FORM,
            );
          },
          backgroundColor: Colors.black38),
    );
  }
}
