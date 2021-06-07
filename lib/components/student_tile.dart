
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grades/entities/student.dart';

class StudentTile extends StatelessWidget {
  final Student student;
  const StudentTile(this.student);

  @override
  Widget build(BuildContext context) {
    final avatar = CircleAvatar(child: Icon(Icons.person));
    return ListTile(
      leading: avatar,
      title: Text(student.name),
      subtitle: Text(
        student.email,
        style: TextStyle(fontSize: 12),
      ),
      trailing: Container(
        width: 80,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/register');
              },
              icon: Icon(Icons.mode_edit_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete_outline_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
