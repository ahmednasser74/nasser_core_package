import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @Named("BaseUrl")
  String get baseUrl => 'My base url';

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
