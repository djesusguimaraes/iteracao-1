import 'package:flutter/material.dart';

class Student {
  final String? id;
  final String name;
  final String email;
  final String password;
  final String nota_1;
  final String nota_2;

  const Student({
    this.id,
    required this.nota_1,
    required this.nota_2,
    required this.name,
    required this.email,
    required this.password,
  });
}
