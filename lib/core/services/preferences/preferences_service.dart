import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsStorageService {
  SharedPreferences? _prefs;

  /// Inicializa o SharedPreferences (lazy load)
  Future<void> _init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> save(String key, dynamic value) async {
    await _init();

    if (value is String) {
      await _prefs!.setString(key, value);
    } else if (value is int) {
      await _prefs!.setInt(key, value);
    } else if (value is double) {
      await _prefs!.setDouble(key, value);
    } else if (value is bool) {
      await _prefs!.setBool(key, value);
    } else if (value is List<String>) {
      await _prefs!.setStringList(key, value);
    } else {
      // Para objetos complexos, salva como JSON
      await _prefs!.setString(key, jsonEncode(value));
    }
  }

  Future<T?> read<T>(String key) async {
    await _init();
    final value = _prefs!.get(key);

    if (value == null) return null;

    if (T == String && value is String) return value as T;
    if (T == int && value is int) return value as T;
    if (T == double && value is double) return value as T;
    if (T == bool && value is bool) return value as T;
    if (value is List<String>) return value as T;

    try {
      return jsonDecode(value.toString()) as T;
    } catch (_) {
      return null;
    }
  }

  Future<void> remove(String key) async {
    await _init();
    await _prefs!.remove(key);
  }

  Future<void> clear() async {
    await _init();
    await _prefs!.clear();
  }
}
