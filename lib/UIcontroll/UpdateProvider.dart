//update ui based on newsapi

import 'package:flutter_riverpod/flutter_riverpod.dart';



// Update the UI based on category like {Sports,Tech,etc}
final newsCategoryProvider = StateProvider((ref) => 'general');