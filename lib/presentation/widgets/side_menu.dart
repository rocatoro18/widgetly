import 'dart:io';

import 'package:flutter/material.dart';
import 'package:widgetly/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    // CONOCER LA DISTANCIA QUE HAY EN EL TOP
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    /*
    if (Platform.isAndroid) {
      print('Android $hasNotch');
    } else {
      print('IOS $hasNotch');
    }
    */

    return NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });
        },
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 20),
              child: const Text('Menu')),
          ...appMenuItems.sublist(0, 3).map((menuItem) =>
              NavigationDrawerDestination(
                  icon: Icon(menuItem.icon), label: Text(menuItem.title))),
          const Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 16, 28), child: Divider()),
          const Padding(
              padding: EdgeInsets.fromLTRB(28, 10, 16, 20),
              child: Text('More Options')),
          ...appMenuItems.sublist(3).map((menuItem) =>
              NavigationDrawerDestination(
                  icon: Icon(menuItem.icon), label: Text(menuItem.title))),
        ]);
  }
}
