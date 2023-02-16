import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TextFormIslemleri(title: 'TextEditingController İşlemleri'),
    );
  }
}

class TextFormIslemleri extends StatefulWidget {
  final String title;
  const TextFormIslemleri({super.key, required this.title});

  @override
  State<TextFormIslemleri> createState() => _TextFormIslemleriState();
}

class _TextFormIslemleriState extends State<TextFormIslemleri> {
  late TextEditingController _emailController;
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;
  int maxLineCount = 1;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: 'hasan@basri.com');
    _textEditingController = TextEditingController(text: 'Örnek : Bu iyiydi');
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus) {
          maxLineCount = 3;
        } else {
          maxLineCount = 1;
        }
      });
    });
  }

  @override
  void dispose() {
    // sayfa değişince kullanmıcaksak yok edilme işlemi böyle yapılıyor
    _emailController.dispose();
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                hintText: 'E-mail Giriniz',
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18.0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_emailController.text),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Parola Giriniz',
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.key),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              focusNode: _focusNode,
              controller: _textEditingController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              maxLines: maxLineCount,
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Değerlendirme',
                hintText: 'Yorum Yapınız',
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.comment),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // butona basıldığında controller içeriği değiştirildi
        onPressed: () {
          _emailController.text = 'dargahasanbasri@gmail.com';
          // build tekrar çalışır setState ile
          setState(() {});
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
