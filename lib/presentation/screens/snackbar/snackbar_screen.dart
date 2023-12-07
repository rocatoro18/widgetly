import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
        content: const Text('Hola Mundo'),
        action: SnackBarAction(label: 'Ok', onPressed: () {}),
        duration: const Duration(seconds: 2));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  // BUILDCONTEXT ES LA INFORMACION DE LA APLICACION
  void openDialog(BuildContext context) {
    // BUILDER = ALGO QUE SE CONSTRUYE EN TIEMPO DE EJECUCION
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('¿Estas seguro?'),
              content: const Text('HOLA OFSDFSDFDSD'),
              actions: [
                TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('Cancelar')),
                FilledButton(
                    onPressed: () => context.pop(),
                    child: const Text('Aceptar'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y Dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(
                      context: context,
                      children: [const Text('ESTO ES UN MENSAJE')]);
                },
                child: const Text('Licencias Usadas')),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: const Text('Mostrar Dialogo de Pantalla'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.remove_red_eye_outlined),
          label: const Text('Mostrar Snackbar'),
          onPressed: () => showCustomSnackBar(context)),
    );
  }
}
