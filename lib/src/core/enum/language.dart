enum Language { en, ar }

extension LanguageExtension on Language {
  String get value => switch (this) {
        Language.ar => 'ar',
        Language.en => 'en',
      };
}
