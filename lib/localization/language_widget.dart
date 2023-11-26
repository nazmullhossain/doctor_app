import 'package:doctor_app/localization/language_controller.dart';
import 'package:doctor_app/localization/language_contsnace.dart';
import 'package:doctor_app/localization/language_model.dart';
import 'package:flutter/material.dart';

class LanguageWidget extends StatelessWidget {
  final LanguageModel languageModel;
  final LocalizationController localizationController;
  final int index;

  const LanguageWidget(
      {super.key,
      required this.languageModel,
      required this.localizationController,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          localizationController.setLanguage(Locale(
            LanguageConstance.languageModel[index].languageCode,
            LanguageConstance.languageModel[index].countryCode,
          ));
          localizationController.setSelectedIndex(index);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "${languageModel.languageName}",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    localizationController.selectedIndex == index
                        ? Positioned(
                            top: 0,
                            right: 0,
                            left: 0,
                            bottom: 70,
                            child: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 40,
                            ),
                          )
                        : SizedBox()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
