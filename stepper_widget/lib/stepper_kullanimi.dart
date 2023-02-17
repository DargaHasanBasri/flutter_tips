import 'package:flutter/material.dart';

class StepperKullanimi extends StatefulWidget {
  const StepperKullanimi({super.key});

  @override
  State<StepperKullanimi> createState() => _StepperKullanimiState();
}

class _StepperKullanimiState extends State<StepperKullanimi> {
  int _aktifStep = 0;
  late String isim, mail, sifre;
  late List<Step> tumStepler;

  @override
  void initState() {
    super.initState();
    tumStepler = _tumStepler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stepper Kullanımı"),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          steps: tumStepler,

          // aktif olan step indeksi ilk başta 0. step aktif
          currentStep: _aktifStep,

          // tıklanılan step aktifleştirme
          onStepTapped: (tiklanilanStep) {
            setState(() {
              _aktifStep = tiklanilanStep;
            });
          },

          // devam butonu aktifleşti
          onStepContinue: () {
            setState(() {
              if (_aktifStep < tumStepler.length - 1) {
                // bir sonraki stepe geçiş sağlanıyor
                _aktifStep++;
              }
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
        title: const Text("Username Başlık"),
        subtitle: const Text("Username Alt başlık"),
        state: StepState.indexed,
        isActive: true,
        content: TextFormField(
          decoration: InputDecoration(
            labelText: "UsernameLabel",
            hintText: "UsernameHint",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      Step(
        title: const Text("Mail Başlık"),
        subtitle: const Text("Mail Alt başlık"),
        state: StepState.indexed,
        isActive: true,
        content: TextFormField(
          decoration: InputDecoration(
            labelText: "MailLabel",
            hintText: "MailHint",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      Step(
        title: const Text("Şifre Başlık"),
        subtitle: const Text("Şifre Alt başlık"),
        state: StepState.indexed,
        isActive: true,
        content: TextFormField(
          decoration: InputDecoration(
            labelText: "ŞifreLabel",
            hintText: "ŞifreHint",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    ];
    return stepler;
  }
}
