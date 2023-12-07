import 'dart:convert';

import 'package:nylo_framework/nylo_framework.dart';

class LocalStorageService {
  /// Get an int value from storage
  static Future<int?> getInt({required String key}) async {
    return int.tryParse(await NyStorage.read<String>(key));
  }

  /// Set an int value to storage
  static Future<void> setInt({required String key, required int value}) async {
    await NyStorage.delete(key);
    await NyStorage.store(key, value);
  }

  /// Get an int value from storage
  static Future<Map<String, dynamic>?> getJson({required String key}) async {
    final result =
        await json.decode(await NyStorage.read<String>(key) as String)
            as Map<String, dynamic>?;
    return result;
  }

  /// Set an int value to storage
  static Future<void> setJson(
      {required String key, required Map<String, dynamic> value}) async {
    await NyStorage.delete(key);
    await NyStorage.store(key, json.encode(value));
  }
}
