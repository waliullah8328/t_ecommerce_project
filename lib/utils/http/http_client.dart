import 'dart:convert';

import 'package:http/http.dart' as http;
class THttpHelper{
  static const String _baseUrl = ""; // Replace my api

  // Helper method to make a get  request
  static Future<Map<String,dynamic>> get (String endPoint) async {
    final response = await http.get(Uri.parse("$_baseUrl/$endPoint"));
    return _handleResponse(response);

  }

  // Helper method to make a post  request
  static Future<Map<String,dynamic>> post (String endPoint,dynamic data) async {
    final response = await http.post(
        Uri.parse("$_baseUrl/$endPoint"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(data),
    );
    return _handleResponse(response);

  }

  // Helper method to make a put request
  static Future<Map<String,dynamic>> put (String endPoint,dynamic data) async {
    final response = await http.put(
      Uri.parse("$_baseUrl/$endPoint"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(data),
    );
    return _handleResponse(response);

  }

  // Helper method to make a delete request
  static Future<Map<String,dynamic>> delete (String endPoint) async {
    final response = await http.delete(
      Uri.parse("$_baseUrl/$endPoint"),

    );
    return _handleResponse(response);

  }

  // Handle the Http Response
  static Map<String,dynamic>_handleResponse(http.Response response){
    if(response.statusCode == 200){
      return json.decode(response.body);
    }
    else {
      throw Exception( "Fail to load data: ${response.statusCode}");
    }

  }


}