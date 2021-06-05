import 'package:app/data/dummy_students.dart';
import 'package:app/entities/student.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Students with ChangeNotifier {
  final Map<String, Student> _items = {...DUMMY_STUDENTS};

  List<Student> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Student byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Student student) {
    // ignore: unnecessary_null_comparison
    if (student == null) {
      return;
    }

    notifyListeners();
  }
}
