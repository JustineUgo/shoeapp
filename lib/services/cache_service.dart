import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheService {
  static String guestKey = "_guest_";

  void store({required String key, required dynamic value});
  dynamic retrieve({required String key});
  Future cleanStorage();
}

@Singleton(as: CacheService)
class SharedPreferenceService implements CacheService {
  final SharedPreferences _prefs;

  SharedPreferenceService(this._prefs);

  @override
  dynamic retrieve({required String key}) {
    String? value = _prefs.get(key) as String?;
    return value == null ? null : json.decode(value);
  }

  @override
  void store({required String key, required value}) {
    _prefs.setString(key, json.encode(value));
  }

  @override
  Future cleanStorage() async {
    await _prefs.clear();
  }
}
