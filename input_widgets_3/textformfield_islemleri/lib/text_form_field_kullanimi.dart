import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class TextFormFieldKullanimi extends StatefulWidget {
  const TextFormFieldKullanimi({super.key});

  @override
  State<TextFormFieldKullanimi> createState() => _TextFormFieldKullanimiState();
}

class _TextFormFieldKullanimiState extends State<TextFormFieldKullanimi> {
  String _email = '', _password = '', _userName = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Form Field Kullanımı'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            // uyarılar her zaman gözükür
            // autovalidateMode: AutovalidateMode.always,

            // uyarılar karakter girmeye başlayınca gözükür
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  //initialValue kullanıcı ilk açtığında göreceği değer
                  //initialValue: 'dargahasanbasri',
                  decoration: const InputDecoration(
                    // errorStyle: TextStyle(color: Colors.deepPurple),
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'İsminiz',
                  ),
                  onSaved: (deger) {
                    _userName = deger!;
                  },
                  validator: (deger) {
                    if (deger!.length < 4) {
                      return 'Username en az 4 karakter olmalı';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'E-posta adresiniz',
                  ),
                  onSaved: (deger) {
                    _email = deger!;
                  },
                  validator: (deger) {
                    if (deger!.isEmpty) {
                      return 'Email boş olamaz!!';
                    } else if (!EmailValidator.validate(deger)) {
                      return 'Geçerli e-posta Giriniz!!!';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Parolanız',
                  ),
                  onSaved: (deger) {
                    _password = deger!;
                  },
                  validator: (deger) {
                    if (deger!.length < 8) {
                      return 'Şifreniz en az 8 karakter içermeli!!!';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    bool validate = _formKey.currentState!.validate();
                    if (validate) {
                      _formKey.currentState!.save();
                      String result =
                          'Username: $_userName\nEmail: $_email\nŞifre: $_password';
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red.shade300,
                          content: Text(
                            result,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      );
                      _formKey.currentState!.reset();
                    }
                  },
                  child: const Text('Onayla'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
