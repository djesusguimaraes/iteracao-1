import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:grades/components/student_note.dart';
import 'package:grades/home.dart';
import 'package:grades/login.dart';
import 'package:grades/view.dart';
import 'add.dart';
import 'database.dart';
//import 'package:firebase_database/firebase_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GRADES CRUD',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => MyHomePage(title: 'GRADES'),
        '/grade': (context) => NotePage(),
      },
    );
  }
}
