import 'package:flutter/material.dart';

class DigerFormElemanlari extends StatefulWidget {
  const DigerFormElemanlari({super.key});

  @override
  State<DigerFormElemanlari> createState() => _DigerFormElemanlariState();
}

class _DigerFormElemanlariState extends State<DigerFormElemanlari> {
  bool? checkBoxState = false;
  String sehir = "";
  bool switchState = false;
  double sliderDeger = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_circle),
      ),
      appBar: AppBar(
        title: const Text('Diğer Form Elemanları'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            CheckboxListTile(
              value: checkBoxState,
              onChanged: (secildi) {
                setState(() {
                  checkBoxState = secildi;
                });
              },
              activeColor: Colors.red,
              title: const Text("Checkbox title"),
              subtitle: const Text("Checkbox Subtitle"),
              secondary: const Icon(Icons.add),
              selected: true,
            ),
            const SizedBox(
              height: 20,
            ),
            RadioListTile<String>(
              value: 'Osmaniye',
              groupValue: sehir,
              onChanged: (deger) {
                setState(() {
                  sehir = deger!;
                  debugPrint("Seçilen değer : $deger");
                });
              },
              title: const Text("Osmaniye"),
              subtitle: const Text("Radio Subtitle"),
              secondary: const Icon(Icons.map),
            ),
            RadioListTile<String>(
              value: 'Adana',
              groupValue: sehir,
              onChanged: (deger) {
                setState(() {
                  sehir = deger!;
                  debugPrint("Seçilen değer : $deger");
                });
              },
              title: const Text("Adana"),
              subtitle: const Text("Radio Subtitle"),
              secondary: const Icon(Icons.map),
            ),
            RadioListTile<String>(
              value: 'Samsun',
              groupValue: sehir,
              onChanged: (deger) {
                setState(() {
                  sehir = deger!;
                  debugPrint("Seçilen değer : $deger");
                });
              },
              title: const Text("Samsun"),
              subtitle: const Text("Radio Subtitle"),
              secondary: const Icon(Icons.map),
            ),
            SwitchListTile(
              value: switchState,
              onChanged: (deger) {
                setState(() {
                  debugPrint("Anlasma onaylandı : $deger");
                  switchState = deger;
                });
              },
              title: const Text("Switch title"),
              subtitle: const Text("Switch subtitle"),
              secondary: const Icon(Icons.refresh),
            ),
            const Text("Değeri Sliderden Seçiniz"),
            Slider(
              value: sliderDeger,
              onChanged: (deger) {
                setState(() {
                  sliderDeger = deger;
                });
              },
              min: 0,
              max: 40,
              divisions: 5,
              label: sliderDeger.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
