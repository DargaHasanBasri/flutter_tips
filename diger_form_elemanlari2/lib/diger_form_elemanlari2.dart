import 'package:flutter/material.dart';

class DigerFormElemanlari2 extends StatefulWidget {
  const DigerFormElemanlari2({super.key});

  @override
  State<DigerFormElemanlari2> createState() => _DigerFormElemanlari2State();
}

class _DigerFormElemanlari2State extends State<DigerFormElemanlari2> {
  String secilenRenk = "Kırmızı";
  String? secilenSehir;
  List<String> tumSehirler = ["Ankara", "Osmaniye", "Samsun", "Adana"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_circle),
      ),
      appBar: AppBar(
        title: const Text('Diğer Form Elemanları2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            DropdownButton<String>(
              items: [
                DropdownMenuItem<String>(
                  value: "Kırmızı",
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 24,
                        height: 24,
                        color: Colors.red,
                        margin: const EdgeInsets.only(right: 10),
                      ),
                      const Text("Kırmızı"),
                    ],
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "Mavi",
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 24,
                        height: 24,
                        color: Colors.blue,
                        margin: const EdgeInsets.only(right: 10),
                      ),
                      const Text("Mavi"),
                    ],
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "Yeşil",
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 24,
                        height: 24,
                        color: Colors.green,
                        margin: const EdgeInsets.only(right: 10),
                      ),
                      const Text("Yeşil"),
                    ],
                  ),
                ),
              ],
              onChanged: (String? secilen) {
                setState(() {
                  secilenRenk = secilen!;
                });
              },
              hint: const Text("Seçiniz"),
              value: secilenRenk,
            ),
            Center(
              child: DropdownButton<String>(
                hint: const Text('Şehir Seçiniz'),
                items: tumSehirler
                    .map(
                      (String oAnkiSehir) => DropdownMenuItem(
                        value: oAnkiSehir,
                        child: Text(oAnkiSehir),
                      ),
                    )
                    .toList(),
                value: secilenSehir,
                onChanged: (String? yeni) {
                  setState(() {
                    secilenSehir = yeni;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
