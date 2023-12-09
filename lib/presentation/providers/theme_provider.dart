// Estado => isDarkmodeProvider = boolean
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetly/config/theme/app_theme.dart';

final isDarkmodeProvider = StateProvider((ref) => false);

// Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);
