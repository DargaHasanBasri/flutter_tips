import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
