import 'package:flutter/material.dart';
import 'package:midi_test_flutter/onbording.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Onbording(),
      theme: ThemeData(primaryColor: Colors.deepOrange),
    );
  }
}