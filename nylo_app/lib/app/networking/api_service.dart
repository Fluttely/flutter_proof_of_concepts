import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:updown_app/app/networking/dio/base_api_service.dart';

/*
|--------------------------------------------------------------------------
| ApiService
| -------------------------------------------------------------------------
| Define your API endpoints

| Learn more https://nylo.dev/docs/5.x/networking
|--------------------------------------------------------------------------
*/

class ApiService extends BaseApiService {
  ApiService({BuildContext? buildContext}) : super(buildContext);

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  @override
  final interceptors = {
    if (getEnv('APP_DEBUG') == true) PrettyDioLogger: PrettyDioLogger()
  };

  Future<List<Map<String, dynamic>>> getMapList(
    String url, {
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    try {
      final response = await network(request: (request) => request.get(url));

      final mapList = List<Map<String, dynamic>>.from(
          response.map((item) => item as Map<String, dynamic>));

      return mapList;
    } catch (e) {
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> postMap(
    String url, {
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    final response = await network(
        request: (request) => request.put(
              url,
              data: data,
            ));

    final mapList = List<Map<String, dynamic>>.from(
        response.map((item) => item as Map<String, dynamic>));

    return mapList;
  }
}
