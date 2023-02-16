import 'package:flutter/material.dart';
import 'package:textformfield_islemleri/sayac_state.dart';

class GlobalKeyKullanimi extends StatelessWidget {
  GlobalKeyKullanimi({super.key});
  final sayacWidgetKey = GlobalKey<SayacWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Global Key Kullanımı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Buton basılma miktarı: '),
            SayacWidget(
              key: sayacWidgetKey,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          sayacWidgetKey.currentState!.arttir();
        },
      ),
    );
  }
}
