import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

// Provider for the currently selected category index in the Menu Screen
final selectedCategoryProvider = StateProvider<int>((ref) => 0);

// Provider for the Veg Only filter toggle
final vegOnlyProvider = StateProvider<bool>((ref) => false);

// Provider for the Quick Cart expansion state
final isCartExpandedProvider = StateProvider<bool>((ref) => false);
