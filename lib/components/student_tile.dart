import 'package:app/entities/student.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentTile extends StatelessWidget {
  final Student student;

  const StudentTile(this.student);

  @override
  Widget build(BuildContext context) {
    final avatar = CircleAvatar(child: Icon(Icons.person));
    return ListTile(
        leading: avatar,
        title: Text(student.name),
        subtitle: Text(student.email),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit),
                color: Colors.orange,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete),
                color: Colors.redAccent,
              ),
            ],
          ),
        ));
  }
}
