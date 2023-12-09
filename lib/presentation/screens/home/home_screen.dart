import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgetly/config/menu/menu_items.dart';
import 'package:widgetly/presentation/widgets/side_menu.dart';
//import 'package:widgetly/presentation/screens/buttons/buttons_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String name = 'home_screen';

  @override
  Widget build(BuildContext context) {
    // ESTO TIENE LA REFERENCIA AL ESTADO ACTUAL DEL SCAFFOLD
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('Flutter + Material 3'),
        ),
        body: const _HomeView(),
        drawer: SideMenu(scaffoldKey: scaffoldKey));
  }
}

class _HomeView extends StatelessWidget {
  // KEY NO SE OCUPA PORQUE ES PRIVADO Y ES LA UNICA REFERENCIA
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        //physics: BouncingScrollPhysics(),
        itemCount: appMenuItems.length,
        itemBuilder: (context, index) {
          final menuItem = appMenuItems[index];
          // ListTile Widget especializado para trabajar con listas
          return _CustomListTile(menuItem: menuItem);
        });
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        // TODO: NAVEGAR A OTRA PANTALLA
        //Navigator.pushNamed(context, menuItem.link);
        /*
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ButtonsScreen()));
        */
        // EXTENCION DE GO ROUTER
        context.push(menuItem.link);
        //context.pushNamed(CardsScreen.name);
      },
    );
  }
}
