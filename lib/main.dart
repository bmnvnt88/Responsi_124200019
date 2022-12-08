import 'package:flutter/material.dart';
import 'home.dart';

// Nama : Bima Novianto
// Nim : 124200003
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsi Praktikum',
      theme: ThemeData(
          // primaryColor: Colors.deepPurple,
          ),
      home: PageBendera(),
    );
  }
}
