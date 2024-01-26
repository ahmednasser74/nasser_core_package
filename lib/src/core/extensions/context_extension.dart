import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../enum/language.dart';

extension NavExtension on BuildContext {
  Future<dynamic> push(Widget page) async {
    Navigator.push(this, MaterialPageRoute(builder: (_) => page));
  }

  Future<dynamic> pushRoute(Route route) async {
    Navigator.of(this).push(route);
  }

  Future<dynamic> pushReplacement(Widget page) async {
    Navigator.pushReplacement(this, MaterialPageRoute(builder: (_) => page));
  }

  void pop(Widget page, [result]) async => Navigator.of(this).pop(result);
}

extension GlobalExtension on BuildContext {
  void dismissKeyboard() => FocusScope.of(this).requestFocus(FocusNode());
}

extension LanguageContextExtension on BuildContext {
  Language get getLanguage => locale.toString() == Language.ar.value ? Language.ar : Language.en;

  bool get languageIsAr => locale.toString() == Language.ar.value;

  bool get languageIsEn => locale.toString() == Language.en.value;

  void updateLanguage(Language language) {
    if (language == Language.ar) {
      setLocale(Locale(Language.ar.value));
      return;
    }
    setLocale(Locale(Language.en.value));
  }
}
