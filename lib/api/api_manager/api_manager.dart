import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/Modal/NewsResponse.dart';
import 'package:news/Modal/SourceResponse.dart';
import 'package:news/api/api_constans/apiConstans.dart';
import 'package:news/api/api_endPoint/end_points.dart';

class ApiManager {
  static Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourceApi,
        {'apiKey': ApiConstants.apiKey, 'category': categoryId});
    try {
      var response = await http.get(url);
      // convert from body string to body json by use jsonDecode then convert to object by SourceResponse.fromJson
      return SourceResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newsApi,
        {'apiKey': ApiConstants.apiKey, 'sources': sourceId});
    try {
      var response = await http.get(url);
      // convert from body string to body json by use jsonDecode then convert to object by SourceResponse.fromJson
      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> getSearchNews(String search) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newsApi,
        {'apiKey': ApiConstants.apiKey, 'q': search});
    try {
      var response = await http.get(url);
      // convert from body string to body json by use jsonDecode then convert to object by SourceResponse.fromJson
      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }
}
