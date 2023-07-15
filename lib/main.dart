import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:little_face/listado.dart';
import 'package:little_face/editar.dart';
import 'package:little_face/login.dart';
import 'package:little_face/infante_objetivos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Little Face',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: MiApp(),
    );
  }
}

class MiApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: "/",
        routes: {
          "/" : (context) => Listado(),
          "/editar": (context) => Editar(),
          "/objetivo": (context) => Objetivo()
        }
    );
  }
}
