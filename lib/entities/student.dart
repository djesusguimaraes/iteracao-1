import 'package:flutter/material.dart';

class Student {
  final String? id;
  final String name;
  final String email;
  final String password;
  final double n1;
  final double n2;

  const Student({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.n1,
    required this.n2,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "password": password,
      "n1": n1,
      "n2": n2
    };
  }
}
