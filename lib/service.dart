import 'dart:convert';
import 'dart:io';

import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'model.dart';
import 'consts.dart';

import 'package:http/http.dart' as http;

class SearchService extends GetConnect {
  Future<dynamic> getJourney(query) async {
    try {
      final queryParameters = {
        'language': 'de',
        'outputFormat': 'RapidJSON',
        'type_sf': 'any',
        'name_sf': query,
      };

      final uri = Uri.http(url_host, url_path, queryParameters);

      final headers = {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded'
      };

      final response = await http.get(uri, headers: headers);

      if (response.statusCode == HttpStatus.ok) {
        final responsebody = jsonDecode(response.body);
        final suggestionList = responsebody['locations']
            .map((e) => SearchResponseModel.fromJson(e))
            .toList();

        return suggestionList;
      }
    } catch (e) {
      print('misbehave() error partially handled ${e.runtimeType}.');
      rethrow; // Allow callers to see the exception.
    }

    return [];
  }
}
