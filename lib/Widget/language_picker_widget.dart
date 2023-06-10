import 'package:flutter/material.dart';
import 'package:localization/Model/Language.dart';
import 'package:localization/Provider/locale_provider.dart';
import 'package:provider/provider.dart';

class LanguagePickerWidget extends StatelessWidget {
  const LanguagePickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    Language selectedLocale = provider.language;

    return Container(
      padding: const EdgeInsets.only(right: 30),
      child: DropdownButton<Language>(
        underline: const SizedBox(),
        icon: Text(
          selectedLocale.flag,
          style: const TextStyle(fontSize: 30),
        ),
        onChanged: (Language? language) async {
          if (language != null) {
            provider.setLocale(language);
          }
        },
        items: Language.languageList
            .map<DropdownMenuItem<Language>>(
              (e) => DropdownMenuItem<Language>(
                value: e,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      e.flag,
                      style: const TextStyle(fontSize: 30),
                    ),
                    Text(e.name)
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
