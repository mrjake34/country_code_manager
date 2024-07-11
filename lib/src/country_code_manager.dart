import 'index.dart';

final class CountryCodeManager {
  const CountryCodeManager._();

  static const CountryCodeManager _instance = CountryCodeManager._();
  static CountryCodeManager get instance => _instance;

  Future<void> init([SupportedLanguage? language]) async {
    await CountryCodeLocalization.instance
        .load(language ?? SupportedLanguage.en);
  }

  List<Country> get countries => codes.map((e) => Country.fromJson(e)).toList();
}
