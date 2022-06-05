import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('ar'),
    const Locale('hi'),
    const Locale('es'),
    const Locale('de'),
  ];
  static String getName(String code) {
    switch (code) {
      case 'ar':
        return 'Arabic';
      case 'hi':
        return 'Hindi';
      case 'es':
        return 'Espanyol';
      case 'de':
        return 'Deutshc';
      case 'en':
      default:
        return 'English';
    }
  }
}
