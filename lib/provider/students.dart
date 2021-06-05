import 'package:app/data/dummy_students.dart';
import 'package:app/entities/student.dart';
import 'package:flutter/material.dart';

class Users with ChangeNotifier {
  final Map<String, Student> _itens = {...DUMMY_STUDENTS};

  List<Student> get all => [..._itens.values];

  int get count => _itens.length;

  Student byIndex(int i) {
    return _itens.values.elementAt(i);
  }

  void put(Student student) {
    final id = Iterable.generate(1).toString();
    _itens.putIfAbsent(
        id,
        () => Student(
              nota_1: student.nota_1,
              nota_2: student.nota_2,
              name: student.name,
              email: student.email,
              password: student.password,
            ));
  }
}
