import 'package:doctor_app/localization/language_model.dart';

class LanguageConstance{

  static const String COUNTRY_CODE = "country_code";
  static const String LANGUAGE_CODE = "language_code";


  static List<LanguageModel>  languageModel =[

    LanguageModel(imageUrl: "en.png", languageName: "English", languageCode: "en", countryCode: "US"),
    LanguageModel(imageUrl: "bn.png", languageName: "বাংলা", languageCode: "bn", countryCode: "BD"),

  ];

}