import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajir/app/data/models/user.dart';
import 'package:hajir/app/modules/mobile_opt/controllers/mobile_opt_controller.dart';
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

  String get refresh => _sharedPref.getString('refresh') ?? '';
  set refresh(String rtoken) => _sharedPref.setString('refresh', rtoken);

  String get name => _sharedPref.getString('name') ?? '';
  String get email => _sharedPref.getString('email') ?? '';
  String get phone => _sharedPref.getString('phone') ?? '';
  bool get employer => _sharedPref.getBool('type') ?? false;
  String get selectedlanguage =>
      _sharedPref.getString('selected_language') ?? '';

  ///setters
  set name(String ename) => _sharedPref.setString('name', ename);
  set email(String eEmail) => _sharedPref.setString('eEmail', eEmail);
  set phone(String ephone) => _sharedPref.setString('phone', ephone);
  set employer(bool emp) => _sharedPref.setBool('emp', emp);
  set selectedlanguage(String lang) =>
      _sharedPref.setString('selected_language', lang);
  Locale getLocale() {
    bool isEnglish =
        _sharedPref.getBool(AuthPreferenceKeys.has_selected_english) ?? true;
    return Locale(isEnglish ? 'en' : 'ne');
  }

  bool get isEnglish =>
      _sharedPref.getBool(AuthPreferenceKeys.has_selected_english) ?? true;

  void changeLang({bool en = true}) async {
    appSettings.selectedlanguage = en ? 'en' : 'ne';
    log(en.toString());
    _sharedPref.setBool(AuthPreferenceKeys.has_selected_english, en);
    Get.updateLocale(Locale(en ? 'en' : 'ne'));
  }

  saveUser(UserModel user) {
    name = user.name.toString();
    email = user.email.toString();
    phone = user.phone.toString();
    employer = user.type ?? false;
  }

  UserModel getuser() {
    return UserModel(name: name, email: email, phone: phone, type: employer);
  }

  void logout() {
    token = '';
    refresh = '';
  }
}
