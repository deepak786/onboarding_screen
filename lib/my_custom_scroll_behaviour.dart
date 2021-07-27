import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


/// check for more details
/// https://flutter.dev/docs/release/breaking-changes/default-scroll-behavior-drag
/// https://github.com/flutter/flutter/issues/86959
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    // etc.
  };
}