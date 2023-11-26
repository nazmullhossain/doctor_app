import 'package:doctor_app/localization/language_controller.dart';
import 'package:doctor_app/localization/language_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.indigo,
          title: Text(
            "Language Change",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: GetBuilder<LocalizationController>(builder: (controller) {
          return  GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1),
            shrinkWrap: true,
            primary: false,
            itemCount: 2,
            itemBuilder: (_, index) {
              return Center(
                child: LanguageWidget(
                  languageModel: controller.languages[index],
                  localizationController: controller,
                  index: index,
                ),
              );
            },
          );
        }));
  }
}
