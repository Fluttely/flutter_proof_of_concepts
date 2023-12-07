import 'dart:convert';

class JsonMapper {
  static bool dataIsAMap(dynamic data) {
    if (data is Map<String, dynamic>) {
      return true;
    }
    throw new Exception('invalid data');
  }

  static bool dataIsAListOfMap(dynamic data) {
    if (data is List<Map<String, dynamic>> || (data is List && data.isEmpty)) {
      return true;
    }
    throw new Exception('invalid data');
  }

  static String tryEncode(dynamic data) {
    try {
      return json.encode(data);
    } catch (_) {
      rethrow;
    }
  }

  static dynamic tryDecode(dynamic data) {
    try {
      return json.decode(data);
    } catch (_) {
      rethrow;
    }
  }

  static List<Map<String, dynamic>> fromDynamicListToMapList(dynamic data) {
    try {
      final list = List<Map<String, dynamic>>.from(
        (data as List<dynamic>).map(
          (dynamic map) => map as Map<String, dynamic>,
        ),
      ).toList();

      return list;
    } catch (_) {
      rethrow;
    }
  }
}
