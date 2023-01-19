import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPreferenceKeys {
  static const has_selected_english = "has_selected_english";
}

final AppSettings appSettings = Get.find();

class AppSettings {
  final SharedPreferences _sharedPref;

  AppSettings(this._sharedPref);

  String get token => _sharedPref.getString('token') ?? '';
  set token(String tkn) => _sharedPref.setString('token', tkn);
  Locale getLocale() {
    bool isEnglish =
        _sharedPref.getBool(AuthPreferenceKeys.has_selected_english) ?? true;
    return Locale(isEnglish ? 'en' : 'ne');
  }

  bool get isEnglish =>
      _sharedPref.getBool(AuthPreferenceKeys.has_selected_english) ?? true;

  void changeLang({bool en = true}) async {
    _sharedPref.setBool(AuthPreferenceKeys.has_selected_english, en);
    Get.updateLocale(Locale(en ? 'en' : 'ne'));
  }
}
