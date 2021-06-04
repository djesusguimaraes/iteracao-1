import 'package:app/views/edit/edit.dart';
import 'package:app/views/lists/notes_list.dart';
import 'package:app/views/login/login_page.dart';
import 'package:app/views/register/register_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grades',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => NotesList(),
        '/edit': (context) => EditPage(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}
