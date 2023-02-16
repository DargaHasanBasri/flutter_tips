import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class TextFormFieldKullanimi extends StatefulWidget {
  const TextFormFieldKullanimi({super.key});

  @override
  State<TextFormFieldKullanimi> createState() => _TextFormFieldKullanimiState();
}

class _TextFormFieldKullanimiState extends State<TextFormFieldKullanimi> {
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
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextFormField(
                  //initialValue kullanıcı ilk açtığında göreceği değer
                  initialValue: 'dargahasanbasri',
                  decoration: const InputDecoration(
                    // errorStyle: TextStyle(color: Colors.deepPurple),
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'İsminiz',
                  ),
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
                  validator: (deger) {
                    if (!EmailValidator.validate(deger!)) {
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
                  validator: (deger) {
                    if (deger!.length < 8) {
                      return 'Şifreniz en az 8 karakter içermeli!!!';
                    } else {
                      return null;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
