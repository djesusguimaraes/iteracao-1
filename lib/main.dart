// import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       home: WidgetComEstado(),
//       debugShowCheckedModeBanner: false,
//     ),
//   );
// }

// class WidgetComEstado extends StatefulWidget {
//   @override
//   _WidgetComEstadoState createState() {
//     return _WidgetComEstadoState();
//   }
// }

// class _WidgetComEstadoState extends State<WidgetComEstado> {
//   var _tamanho = 32.0;

//   void _aumentar() {
//     setState(() {
//       _tamanho = _tamanho + 16;
//     });
//   }

//   void _diminuir() {
//     setState(() {
//       _tamanho = _tamanho - 16;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           FlutterLogo(size: _tamanho),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               FloatingActionButton(
//                 onPressed: _aumentar,
//                 child: Icon(Icons.add),
//               ),
//               SizedBox(width: 10),
//               FloatingActionButton(
//                 onPressed: _diminuir,
//                 child: Icon(Icons.remove),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:app/pages/loginPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grades',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: LoginPage(),
    );
  }
}
