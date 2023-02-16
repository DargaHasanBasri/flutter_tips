import 'package:flutter/material.dart';
import 'package:textformfield_islemleri/global_key_kullanimi.dart';
import 'package:textformfield_islemleri/text_form_field_kullanimi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Text Form Field',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GlobalKeyKullanimi(), //TextFormFieldKullanimi(),
    );
  }
}
