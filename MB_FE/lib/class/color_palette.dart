import 'package:flutter/painting.dart';

class Palette {
  Palette._();

  static const Color accent = Color.fromARGB(255, 203, 18, 18);

  static const Color buffer = Color.fromARGB(255, 255, 150, 150);

  static const Color black = Color.fromARGB(255, 0, 0, 0);

  static const Color white = Color.fromARGB(255, 255, 255, 255);

  static const Color light = Color.fromARGB(255, 225, 225, 225);

  static const Color dark = Color.fromARGB(255, 120, 120, 120);

  static const Color loadingBase = Color.fromARGB(255, 200, 200, 200);

  static const Color loadingHighlight = Color.fromARGB(255, 225, 225, 225);

  static const Color link = Color.fromARGB(255, 0, 148, 255);

  static const Color error = Color.fromARGB(255, 255, 84, 84);

  static const Color success = Color.fromARGB(255, 52, 228, 114);

  static const Color background = Color.fromARGB(255, 255, 255, 255);

  static getStatusColor(int statusTypeId) {
    switch (statusTypeId) {
      case 1: // Preparing Food
        return const Color.fromARGB(255, 200, 50, 50);
      case 2: // DINE IN: Served All
        return const Color.fromARGB(255, 52, 228, 114);
      case 3: // DELIVERY: Delivering / Delivered
        return const Color.fromARGB(255, 52, 228, 114);
      case 4: // DELIVERY: Waiting to pick-up dish
        return const Color.fromARGB(255, 225, 175, 50);
      case 5: // PICK-UP: Waiting for dish pick up
        return const Color.fromARGB(255, 52, 228, 114);
      case 6: // Finished / Paid
        return const Color.fromARGB(255, 60, 160, 220);
      default:
        return dark;
    }
  }
}
