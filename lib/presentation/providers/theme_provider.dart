// Estado => isDarkmodeProvider = boolean
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetly/config/theme/app_theme.dart';

// Un simple boolean (StateProvider mantener una pieza de estado)
final isDarkmodeProvider = StateProvider((ref) => false);

// Listado de colores inmutable (Provider valores inmutables)
final colorListProvider = Provider((ref) => colorList);

// Un simple int
final selectedColorProvider = StateProvider((ref) => 0);

// Un objeto de tipo AppTheme (custom) (StateNotifierProvider mantener un estado pero mas elaborado)
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

// Controller o Notifier
// ThemeNotifier es el que Controla
// AppTheme ese el estado (Una Instancia de AppTheme)
class ThemeNotifier extends StateNotifier<AppTheme> {
  // STATE = ESTADO = NEW APPTHEME()
  ThemeNotifier() : super(AppTheme());

  void toggleDarkmode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {}
}
