import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/ModelApiControl/Newsmodel.dart';
import 'package:news/UIcontroll/UpdateProvider.dart';


final newsDataProvider = FutureProvider<List>((ref) async {
  String apiKey = '4873b1f0f83342d68d450105c7fd9f70';
   final category = ref.watch(newsCategoryProvider);
  final response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?category=$category&language=en&apiKey=$apiKey'));
    if (response.statusCode == 200) {
     List<NewsModel> newsList = (json.decode(response.body)['articles'] as List)
          .map((article) => NewsModel.fromJson(article))
          .toList();
      return newsList;
      
    } else {
      throw Exception('Failed to load news');
    }
});