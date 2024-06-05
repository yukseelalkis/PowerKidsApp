import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/splash_screen/splash_screen.dart';
import 'package:flutter_application_1/services/auth/auth_services.dart';

class MyDrawe extends StatelessWidget {
  const MyDrawe({super.key});

  void logout() {
    final authServices = AuthServices();
    authServices.signOuth();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const DrawerHeader(
              child: Icon(
            Icons.message_outlined,
            size: 64,
          )),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: const Text("M E S A J"),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: const Text("S E T T I N G S"),
                  leading: const Icon(Icons.settings),
                  onTap: () {},
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ListTile(
                title: const Text("L O G O U T"),
                leading: const Icon(Icons.logout_outlined),
                onTap: logout),
          ),
        ],
      ),
    );
  }
}
