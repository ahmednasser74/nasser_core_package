import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../index.dart';

@module
abstract class RegisterModule {
  @Named("BaseUrl")
  String get baseUrl => 'My base url';

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @singleton
  FirebaseAnalytics firebaseMessaging() => FirebaseAnalytics.instance;

  @singleton
  Future<FirebaseApp> firebase() => Firebase.initializeApp();
}
