import 'package:flutter/material.dart';
import 'package:ui_state_koruma/models/veri.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa(Key k) : super(key: k);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  late List<Veri> tumVeriler;

  @override
  void initState() {
    super.initState();
    tumVeriler = [
      Veri('Biz Kimiz', 'Biz kimizin içeriği buraya gelecek', false),
      Veri('Biz Neredeyiz', 'Biz neredeyiz içeriği buraya gelecek', false),
      Veri('Misyonumuz', 'Biz kimizin içeriği buraya gelecek', false),
      Veri('Vizyonumuz', 'Biz kimizin içeriği buraya gelecek', false),
      Veri('İletişim', 'Biz kimizin içeriği buraya gelecek', false),
      Veri('İletişim', 'Biz kimizin içeriği buraya gelecek', false),
      Veri('İletişim', 'Biz kimizin içeriği buraya gelecek', false),
      Veri('İletişim', 'Biz kimizin içeriği buraya gelecek', false),
      Veri('İletişim', 'Biz kimizin içeriği buraya gelecek', false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ExpansionTile(
          key: PageStorageKey('$index'),
          initiallyExpanded: tumVeriler[index].expanded,
          title: Text(
            tumVeriler[index].baslik,
          ),
          children: [
            Container(
              color:
                  index % 2 == 0 ? Colors.red.shade300 : Colors.yellow.shade300,
              height: 100,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(tumVeriler[index].icerik),
              ),
            )
          ],
        );
      },
      itemCount: tumVeriler.length,
    );
  }
}
