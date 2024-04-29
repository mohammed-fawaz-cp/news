import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/ModelApiControl/newscontroller.dart';
import 'package:news/UIcontroll/UpdateProvider.dart';

class NewsMainPage extends ConsumerWidget {
  const NewsMainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final NewsController = ref.watch(newsDataProvider.notifier)..fetchNews(ref);
    final newsData = ref.watch(newsDataProvider);
    
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: () {
        Scaffold.of(context).openDrawer(

        );
      }, icon: Icon(Icons.menu)),
        title: Text('News'),
      ),
      body: Center(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(dense: true,
              title: Text(newsData[index].title ?? ''),
              subtitle: Text(newsData[index].description ?? ''),
              leading: newsData[index].urlToImage != null
                  ? Image.network(newsData[index].urlToImage!)
                  : null,
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: newsData.length,
        ),
      ),drawer: Drawer(
        child: ListView(
          // Add your drawer content here (e.g., ListTile widgets)
          children: [
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Handle item tap
                Navigator.pop(context); // Close drawer
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Handle item tap
                Navigator.pop(context); // Close drawer
              },
            ),
          ],
        ),
    ));
  }}