

 import 'dart:convert';

import 'package:doctor_app/localization/language_controller.dart';
import 'package:doctor_app/localization/language_contsnace.dart';
import 'package:doctor_app/localization/language_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, Map<String, String>>> init ()async{

  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));

  Map<String, Map<String, String>> _languages = Map();

  for(LanguageModel languageModel in LanguageConstance.languageModel){

   String jsonStringValue = await rootBundle.loadString("assets/language/${languageModel.languageCode}.json");

   Map<String,dynamic> _mappedJson = json.decode(jsonStringValue);

   Map<String,String> _json = Map();

   _mappedJson.forEach((key, value) {

    _json[key] = value.toString();

   });

   _languages['${languageModel.languageCode}_${languageModel.countryCode}']= _json;
  }
  return _languages;

 }