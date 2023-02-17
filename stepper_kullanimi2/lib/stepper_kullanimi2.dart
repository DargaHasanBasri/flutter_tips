import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class StepperKullanimi2 extends StatefulWidget {
  const StepperKullanimi2({super.key});

  @override
  State<StepperKullanimi2> createState() => _StepperKullanimi2State();
}

class _StepperKullanimi2State extends State<StepperKullanimi2> {
  int _aktifStep = 0;
  String? isim, mail, sifre;
  bool _obscureText = true;
  late List<Step> tumStepler;
  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();
  bool _passwordVisible = false;
  bool hata = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    // build içine yazmamızın sebebi her işlemde değişen bir durum mevcut
    // kalem simgesinin tik işaretine dönmesi gibi
    tumStepler = _tumStepler();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Stepper Kullanımı"),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Row(
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(110, 10),
                      elevation: 12,
                      backgroundColor: Colors.deepPurple),
                  onPressed: details.onStepContinue,
                  child: const Text('Devam', style: TextStyle(fontSize: 16)),
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(110, 10),
                      elevation: 12,
                      backgroundColor: Colors.red),
                  onPressed: details.onStepCancel,
                  child: const Text(
                    'Geri',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            );
          },
          steps: tumStepler,
          // aktif olan step indeksi ilk başta 0. step aktif
          currentStep: _aktifStep,

          // devam butonu aktifleşti
          onStepContinue: () {
            setState(() {
              _continueButtonControl();
            });
          },

          // geri butonu aktifleşti
          onStepCancel: () {
            setState(() {
              if (_aktifStep > 0) {
                _aktifStep--;
              } else {
                _aktifStep = 0;
              }
            });
          },
        ),
      ),
    );
  }

  List<Step> _tumStepler() {
    List<Step> stepler = [
      Step(
        title: const Text("İsim", style: TextStyle(fontSize: 22)),
        subtitle:
            const Text("Kullanıcı Adınız", style: TextStyle(fontSize: 12)),
        state: _stateleriAyarla(0),
        isActive: true,
        content: TextFormField(
          key: key0,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.people),
            hintText: "Kullanıcı Adı Giriniz",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          validator: (girilenDeger) {
            if (girilenDeger!.length < 6) {
              return "En az 6 karakter giriniz!";
            }
          },
          onSaved: (girilenDeger) {
            isim = girilenDeger;
          },
        ),
      ),
      Step(
        title: const Text("Email", style: TextStyle(fontSize: 22)),
        subtitle: const Text("Email Adresiniz", style: TextStyle(fontSize: 12)),
        state: _stateleriAyarla(1),
        isActive: true,
        content: TextFormField(
          keyboardType: TextInputType.emailAddress,
          key: key1,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.email),
            hintText: "Email Adresinizi Giriniz",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          validator: (girilenDeger) {
            if (!EmailValidator.validate(girilenDeger!)) {
              return "Geçerli mail giriniz!";
            }
          },
          onSaved: (girilenDeger) {
            mail = girilenDeger;
          },
        ),
      ),
      Step(
        title: const Text("Parola", style: TextStyle(fontSize: 22)),
        subtitle: const Text("Şifreniz", style: TextStyle(fontSize: 12)),
        state: _stateleriAyarla(2),
        isActive: true,
        content: TextFormField(
          key: key2,
          keyboardType: TextInputType.text,
          obscureText: !_passwordVisible,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.key),
            hintText: "Şifre Giriniz",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Theme.of(context).primaryColorDark,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
          ),
          validator: (girilenDeger) {
            if (girilenDeger!.length < 8) {
              return "Şifre kısa! En az 8 karakter olmalı!";
            }
          },
          onSaved: (girilenDeger) {
            sifre = girilenDeger;
          },
        ),
      ),
    ];
    return stepler;
  }

  StepState _stateleriAyarla(int oAnkiStep) {
    if (_aktifStep == oAnkiStep) {
      if (hata) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    } else {
      return StepState.complete;
    }
  }

  void _continueButtonControl() {
    switch (_aktifStep) {
      case 0:
        // currentState o anki durumu
        if (key0.currentState!.validate()) {
          key0.currentState!.save();
          hata = false;
          _aktifStep = 1;
        } else {
          hata = true;
        }
        break;

      case 1:
        if (key1.currentState!.validate()) {
          key1.currentState!.save();
          hata = false;
          _aktifStep = 2;
        } else {
          hata = true;
        }
        break;
      case 2:
        if (key2.currentState!.validate()) {
          key2.currentState!.save();
          hata = false;
          _aktifStep = 2;
          formTamamlandi();
        } else {
          hata = true;
        }
        break;
    }
  }

  void formTamamlandi() {
    String result = "Username: $isim\nEmail: $mail\nPassword: $sifre";
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          result,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
