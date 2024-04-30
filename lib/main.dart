import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/Pages/DetailPage.dart';
import 'package:news/Pages/NewsMainPage.dart';
import 'package:news/UIcontroll/UItheme.dart';


void main(List<String> args) {
  runApp(const ProviderScope(child: NewsApp()));
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(darkTheme: ThemeData(
      useMaterial3: true, colorScheme: darkColorScheme),
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      initialRoute: '/',
      routes: {
        '/': (context) => NewsMainPage(),
        'details':(context)=>const DetailPage()
      },
    );
  }
}