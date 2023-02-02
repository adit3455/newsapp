import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/config/greeting_config.dart';

import '../blocs/export_blocs.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("${GreetingConfig().nameDrawer}"),
            accountEmail: Text(auth.currentUser?.isAnonymous == true
                ? "Anonymous"
                : "${auth.currentUser!.email}"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("${GreetingConfig().getPhoto()}"),
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey[900],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Edit User"),
            onTap: () => Navigator.pushNamed(context, "/editUser"),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () => Navigator.pushNamed(context, '/setting'),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              context.read<AuthBloc>().add(SignOutRequested());
            },
          )
        ],
      ),
    );
  }
}
