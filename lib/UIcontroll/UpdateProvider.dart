//update ui based on newsapi

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/ModelApiControl/fetchData.dart';
import 'package:news/ModelApiControl/newscontroller.dart';

final newsDataProvider = StateNotifierProvider<NewsController, List<NewsModel>>((ref) {
  return NewsController();
});