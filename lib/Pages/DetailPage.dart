import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
   
    final args = ModalRoute.of(context)!.settings.arguments as Map;
   final controller = newsController(args['url']);
    return SafeArea(child: Scaffold(
    
      body: WebViewWidget(controller: controller),));
  }
}


  

  newsController(String url){
    return WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
 
  
  ..loadRequest(Uri.parse(url));
  }