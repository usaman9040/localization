class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static Language? findByLanguageCode(String languageCode) {
    try {
      return languageList.firstWhere((element) =>
      element.languageCode == languageCode);
    } catch(_) {
      return null;
    }
  }

  static List<Language> languageList = [
    Language(0, "🌐", "System", "system"),
    Language(1, "🇺🇸", "English", "en"),
    Language(2, "🇪🇸", "Español", "es"),
  ];
}