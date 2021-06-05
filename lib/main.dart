import 'package:app/components/student_note.dart';
import 'package:app/views/lists/notes_list.dart';
import 'package:app/views/login/login_page.dart';
import 'package:app/views/register/register_page.dart';
import 'package:app/provider/students.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Users(),
        ),
      ],
      child: MaterialApp(
        title: 'Grades',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/home': (context) => NotesList(),
          '/register': (context) => RegisterPage(),
          '/note': (context) => NotePage(),
        },
      ),
    );
  }
}
