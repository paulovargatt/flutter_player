import 'dart:convert' as cnv;

import 'package:get/get.dart';
import 'package:get_app_flutter/app/data/models/news_model.dart';
import 'package:get_app_flutter/app/dot_env.dart';

class NewsProvider extends GetConnect {
  final api = apiURL;

// Get request
  getNews(int count, int page) async {
    List<NewsModel> list = [];
    var response = await get(
        api + '/bandnews/news/latest/${count}?page=${page}',
        headers: {'Authorization': 'bearer token'});
    if (response.statusCode == 200) {
      return response.body['videos']['data'];
    }
  }
}
