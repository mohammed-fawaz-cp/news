import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/ModelApiControl/newscontroller.dart';
import 'package:news/UIcontroll/UpdateProvider.dart';

class NewsMainPage extends ConsumerWidget {
   NewsMainPage({super.key});
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
 void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final NewsController = ref.watch(newsDataProvider.notifier).fetchNews(ref);
    final newsData = ref.watch(newsDataProvider);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final subtitle =  ref.watch(newsCategoryProvider);
    return Scaffold(key: _scaffoldKey,
      appBar: AppBar(leading: IconButton(onPressed: _openDrawer, icon: Icon(Icons.menu)),
        title: Text('NeWs'),bottom: PreferredSize(preferredSize: Size(width, 50), child: Align(alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('$subtitle',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
          ))),
      ),
      body:Center(
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
        child: SafeArea(
          child: ListView(
            
            children: [
              ListTile(
                title: Text('Top Headlines',style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: () {
                 ref.read(newsCategoryProvider.notifier).update((state) => 'general');
                  Navigator.pop(context); // Close drawer
                },
              ),
              ListTile(
                title: Text('Sports',style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: () {
                  ref.read(newsCategoryProvider.notifier).update((state) => 'sports');
                  Navigator.pop(context); // Close drawer
                },
              ),ListTile(
                title: Text('Technology',style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: () {
                  ref.read(newsCategoryProvider.notifier).update((state) => 'technology');
                  Navigator.pop(context); // Close drawer
                },
              ),ListTile(
                title: Text('Science',style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: () {
                  ref.read(newsCategoryProvider.notifier).update((state) => 'science');
                  Navigator.pop(context); // Close drawer
                },
              ),
              ListTile(
                title: Text('Health',style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: () {
                  ref.read(newsCategoryProvider.notifier).update((state) => 'health');
                  Navigator.pop(context); // Close drawer
                },
              ),
              ListTile(
                title: Text('Entertainment',style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: () {
                  ref.read(newsCategoryProvider.notifier).update((state) => 'entertainment');
                  Navigator.pop(context); // Close drawer
                },
              ),
              ListTile(
                title: Text('business',style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: () {
                  ref.read(newsCategoryProvider.notifier).update((state) => 'business');
                  Navigator.pop(context); // Close drawer
                },
              ),
            ],
          ),
        ),
    ));
  }}//! debug point