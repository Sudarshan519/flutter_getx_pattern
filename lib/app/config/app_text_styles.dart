import 'package:flutter/material.dart';

/// AppTextStyle format as follows:
/// [fontWeight][fontSize][colorName][opacity]
/// Example: bold18White05
///
class AppTextStyles {
  static TextStyle title = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle body = TextStyle(
    fontSize: 13,
    color: Colors.grey,
  );
  static TextStyle medium = const TextStyle(fontSize: 14, color: Colors.grey);
  static TextStyle regular =
      const TextStyle(fontSize: 19, fontWeight: FontWeight.w400);
  static TextStyle l1 =
      const TextStyle(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w600);
  static TextStyle l2 = TextStyle(fontSize: 10, color: Colors.grey);
  static TextStyle b1 = TextStyle(fontWeight: FontWeight.w700, fontSize: 16);
  static TextStyle b2 = TextStyle(fontWeight: FontWeight.w600, fontSize: 14);
}