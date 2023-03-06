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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("hasanbasridarga"),
              accountEmail: Text("dargahasanbasri@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.purple,
                child: Text("HBD"),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor: Colors.yellow,
                  child: Text("ASD"),
                ),
                CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text("HD"),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  const ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Ana Sayfa"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  const ListTile(
                    leading: Icon(Icons.call),
                    title: Text("Ara"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  const ListTile(
                    leading: Icon(Icons.account_box),
                    title: Text("Profil"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  const Divider(),
                  InkWell(
                    splashColor: Colors.green,
                    child: const ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Ana Sayfa"),
                      trailing: Icon(Icons.chevron_right),
                    ),
                    onTap: () {},
                  ),
                  const ListTile(
                    leading: Icon(Icons.call),
                    title: Text("Ara"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  const ListTile(
                    leading: Icon(Icons.account_box),
                    title: Text("Profil"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  const Divider(),
                  const ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Ana Sayfa"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  const ListTile(
                    leading: Icon(Icons.call),
                    title: Text("Ara"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  const ListTile(
                    leading: Icon(Icons.account_box),
                    title: Text("Profil"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  const Divider(),
                  const ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Ana Sayfa"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  const ListTile(
                    leading: Icon(Icons.call),
                    title: Text("Ara"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  const ListTile(
                    leading: Icon(Icons.account_box),
                    title: Text("Profil"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Drawer Kullanımı"),
      ),
      body: Column(),
    );
  }
}
