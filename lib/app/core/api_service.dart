import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

class ApiService {
  ApiService._privateConstructor();

  static final ApiService _instance = ApiService._privateConstructor();

  factory ApiService() => _instance;

  Future<Map<String, dynamic>> _performRequest(
    Future<Response> Function() request, {
    Duration timeout = const Duration(seconds: 10),
  }) async {
    try {
      Response response = await request().timeout(timeout);
      if (response.statusCode >= 200 && response.statusCode < 400) {
        return {"success": true, "response": response.body, "statusCode": response.statusCode};
      }
      return {"success": false, "response": response.body, "statusCode": response.statusCode};
    } on TimeoutException {
      return {
        "success": false,
        "response": {"message": "Request timed out. Please try again later.", "statusCode": 500},
      };
    } on ClientException {
      return {
        "success": false,
        "response": {"message": "Connection error. Please check your internet.", "statusCode": 500},
      };
    } catch (e) {
      return {
        "success": false,
        "response": {"message": "An error occurred: ${e.toString()}", "statusCode": 500},
      };
    }
  }

  Future<Map<String, dynamic>> postRequest(String url, Map<String, String> headers, Map<String, dynamic> body) async {
    Map<String, dynamic> response = await _performRequest(
      () => post(Uri.parse(url), headers: headers, body: jsonEncode(body)),
    );
    return response;
  }

  Future<Map<String, dynamic>> getRequest(String url, Map<String, String> headers) async {
    Map<String, dynamic> response = await _performRequest(() => get(Uri.parse(url), headers: headers));
    return response;
  }
}
