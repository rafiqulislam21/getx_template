import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageService {
  final _box = GetStorage();
  final _key = 'locale';


  /// Get isDarkMode info from local storage and return ThemeMode
  Locale get locale {
    Locale localeJson = Locale(_loadLanguageFromBox().split("_")[0],_loadLanguageFromBox().split("_")[1]);
    return localeJson??Locale('en', 'US');
  }

  /// Load isDArkMode from local storage and if it's empty, returns false (that means default theme is light)
  String _loadLanguageFromBox() => _box.read(_key) ?? Locale('en', 'US').toString();

  /// Save isDarkMode to local storage
  _saveThemeToBox(String locale) => _box.write(_key, locale);

  /// Switch theme and save to local storage
  void switchLanguage({@required Locale changeLocale}) {
    // print(locale.split("_"));
    // Locale localeJson = Locale(changeLocale.split("_")[0],changeLocale.split("_")[1]);
    Get.updateLocale(changeLocale);
    // print(Locale('en', 'US').toString());
    _saveThemeToBox(changeLocale.toString());
  }
}