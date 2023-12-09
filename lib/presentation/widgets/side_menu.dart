import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });
        },
        children: [
          NavigationDrawerDestination(
              icon: Icon(Icons.add), label: Text('Home Screen')),
          NavigationDrawerDestination(
              icon: Icon(Icons.app_registration_rounded),
              label: Text('Otra Pantalla'))
        ]);
  }
}
