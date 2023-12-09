import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetly/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  const ThemeChangerScreen({super.key});

  static const name = 'theme_changer_screen';

  @override
  Widget build(BuildContext context, ref) {
    //final isDarkMode = ref.watch(isDarkmodeProvider);
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
              onPressed: () {
                /*
                ref
                    .read(isDarkmodeProvider.notifier)
                    .update((isDarkMode) => !isDarkMode);
                */
                ref.read(themeNotifierProvider.notifier).toggleDarkmode();
              },
              icon: isDarkMode
                  ? const Icon(Icons.dark_mode_outlined)
                  : const Icon(Icons.light_mode_outlined))
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    //final int selectedColor = ref.watch(selectedColorProvider);
    final selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final color = colors[index];
          return RadioListTile(
              title: Text(
                'Este color',
                style: TextStyle(color: color),
              ),
              subtitle: Text('${color.value}'),
              activeColor: color,
              value: index,
              // GROUP VALUE ES EL VALOR SELECCIONADO
              groupValue: selectedColor,
              onChanged: (value) {
                // TODO: NOTIFICAR EL CAMBIO
                //ref.read(selectedColorProvider.notifier).state = index;
                ref
                    .read(themeNotifierProvider.notifier)
                    .changeColorIndex(index);
              });
        });
  }
}
