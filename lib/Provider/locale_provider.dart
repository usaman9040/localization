import 'package:flutter/cupertino.dart';
import 'package:localization/Constant/local_data_key.dart';
import 'package:localization/Model/Language.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  late Language _lng;

  LocaleProvider() {
    _lng = Language.languageList[0];
    fetchLocale();
  }

  Locale? get locale {
    if (_lng.languageCode == "system") return null;
    return Locale(_lng.languageCode);
  }

  Language get language {
    return _lng;
  }

  Future<void> setLocale(Language lng) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(LAGUAGE_CODE, lng.languageCode);
    _lng = lng;
    notifyListeners();
  }

  Future<void> fetchLocale() async {
    final prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString(LAGUAGE_CODE);
    if (languageCode == null) return;

    final lng = Language.findByLanguageCode(languageCode);
    if (lng != null) {
      _lng = lng;
      notifyListeners();
    }
  }
}