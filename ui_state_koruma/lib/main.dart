import 'package:flutter/material.dart';
import 'package:ui_state_koruma/ana_sayfa.dart';
import 'package:ui_state_koruma/arama.dart';
import 'package:ui_state_koruma/drawer_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drawer Class',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int secilenMenuItem = 0;
  late List<Widget> tumSayfalar;
  late AnaSayfa sayfaAna;
  late AramaSayfasi sayfaArama;

  var keyAnaSayfa = const PageStorageKey('key_ana_sayfa');
  var keyArama = const PageStorageKey('key_arama_sayfa');

  @override
  void initState() {
    super.initState();
    sayfaAna = AnaSayfa(keyAnaSayfa);
    sayfaArama = AramaSayfasi(keyArama);
    tumSayfalar = [sayfaAna, sayfaArama, sayfaAna, sayfaArama];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        title: const Text("Drawer ve Bottom Nav Bar"),
      ),
      body: tumSayfalar[secilenMenuItem],
      bottomNavigationBar: bottomNavMenu(),
    );
  }

  BottomNavigationBar bottomNavMenu() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "AnaSayfa",
          backgroundColor: Colors.amber,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_off),
          activeIcon: Icon(Icons.search),
          label: "Ara",
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: "Ekle",
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box),
          label: "Profil",
          backgroundColor: Colors.blue,
        ),
      ],
      type: BottomNavigationBarType.shifting,
      currentIndex: secilenMenuItem,
      onTap: (index) => setState(() {
        secilenMenuItem = index;
      }),
    );
  }
}
