import 'package:doctor_app/localization/language_contsnace.dart';
import 'package:doctor_app/localization/language_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationController extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;

  LocalizationController({required this.sharedPreferences}) {
    loadCurrentLanguage();
  }

  Locale _locale = Locale(
    LanguageConstance.languageModel[0].languageCode,
    LanguageConstance.languageModel[0].countryCode,
  );

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  List<LanguageModel> _languages = [];

  Locale get locale => _locale;

  List<LanguageModel> get languages => _languages;

  void loadCurrentLanguage() async {
    _locale = Locale(
        sharedPreferences.getString(LanguageConstance.LANGUAGE_CODE) ??
            LanguageConstance.languageModel[0].languageCode,
        sharedPreferences.getString(LanguageConstance.COUNTRY_CODE) ??
            LanguageConstance.languageModel[0].countryCode);

    for (int index = 0;
        index < LanguageConstance.languageModel.length;
        index++) {
      if (LanguageConstance.languageModel[index].languageCode ==
          _locale.languageCode) {
        _selectedIndex = index;
        break;
      }
    }
    _languages = [];
    _languages.addAll(LanguageConstance.languageModel);
    update();
  }

  void setLanguage(Locale locale) {
    Get.updateLocale(locale);
    _locale = locale;
    saveChange(_locale);
    update();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    update();
  }

  saveChange(Locale locale) async {
    await sharedPreferences.setString(
        LanguageConstance.LANGUAGE_CODE, locale.languageCode);
    await sharedPreferences.setString(
        LanguageConstance.COUNTRY_CODE, locale.countryCode!);
  }
}
