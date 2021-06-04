import 'package:flutter/material.dart';

class HomeProf extends StatelessWidget {
  const HomeProf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "A+ Dashboard",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Text('TEste'),
          ],
        ),
      ),
    );
  }
}
