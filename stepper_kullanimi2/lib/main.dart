import 'package:flutter/material.dart';
import 'package:stepper_kullanimi2/stepper_kullanimi2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stepper Uygulama',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const StepperKullanimi2(),
    );
  }
}
