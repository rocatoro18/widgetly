import 'package:flutter_riverpod/flutter_riverpod.dart';

// STATEPROVIDER = PROVEDOR DE UN ESTADO (¿PODRIA SER REFERENCIA REACTIVA?)
final counterProvider = StateProvider<int>((ref) => 5);
