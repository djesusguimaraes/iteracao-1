import 'package:flutter/material.dart';
import 'package:grades/add.dart';
import 'package:grades/database.dart';
import 'package:grades/view.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Database db;
  List docs = [];
  initialise() {
    db = Database();
    db.initiliase();
    db.read().then(
          (value) => {
            setState(
              () {
                docs = value;
              },
            ),
          },
        );
  }

  @override
  void initState() {
    super.initState();
    initialise();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Alunos"),
        toolbarHeight: 80,
        leadingWidth: 45,
        leading: Icon(Icons.person),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            icon: Icon(Icons.exit_to_app_outlined),
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: docs.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.teal[50],
            margin: EdgeInsets.all(5),
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text(docs[index]['nome']),
              subtitle: Text(docs[index]['email']),
              trailing: Text(
                ((docs[index]['n1'] + docs[index]['n2']) / 2).toString(),
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => View(
                      aluno: docs[index],
                      db: db,
                      key: UniqueKey(),
                    ),
                  ),
                ).then(
                  (value) => {
                    if (value != null) {initialise()}
                  },
                );
              },
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(docs.length);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Add(db: db),
            ),
          ).then(
            (value) {
              if (value != null) {
                initialise();
              }
            },
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
