import 'package:flutter/material.dart';

class Student {
  final String? id;
  final String name;
  final String email;
  final String password;

  const Student({
    this.id,
    required this.name,
    required this.email,
    required this.password,
  });
}
