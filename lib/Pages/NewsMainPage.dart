import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/ModelApiControl/newsfetch.dart';
import 'package:news/UIcontroll/UpdateProvider.dart';

class NewsMainPage extends ConsumerWidget {
   NewsMainPage({super.key});
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
 void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   
    final newsData = ref.watch(newsDataProvider);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final subtitle =  ref.watch(newsCategoryProvider);
    return Scaffold(key: _scaffoldKey,
      appBar: AppBar(leading: IconButton(onPressed: _openDrawer, icon: const Icon(Icons.menu)),
        title: const Text('NeWs'),bottom: PreferredSize(preferredSize: Size(width, 50), child: Align(alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(subtitle,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
          ))),
      ),
      body:newsData.when(data: (data) {
        return Center(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(dense: true,
              title: Text(data[index].title ?? ''),
              subtitle: Text(data[index].description ?? ''),
              leading: data[index].urlToImage != null
                  ? Image.network(data[index].urlToImage!)
                  : null,onTap: () {
                    Navigator.pushNamed(context, 'details', arguments: {"url":data[index].articleUrl,
                    'title':data[index].title,
                    });
                  },
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: data.length,
        ),
      );
      },
       error: (error, stackTrace) {
         return Center(child: Text('$error'));
       },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
        ),drawer: Drawer(
        child: SafeArea(
          child: ListView(
            
            children: [
              ListTile(
                title: const Text('Top Headlines',style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: () {
                 ref.read(newsCategoryProvider.notifier).update((state) => 'general');
                  Navigator.pop(context); // Close drawer
                },
              ),
              ListTile(
                title: const Text('Sports',style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: () {
                  ref.read(newsCategoryProvider.notifier).update((state) => 'sports');
                  Navigator.pop(context); // Close drawer
                },
              ),ListTile(
                title: const Text('Technology',style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: () {
                  ref.read(newsCategoryProvider.notifier).update((state) => 'technology');
                  Navigator.pop(context); // Close drawer
                },
              ),ListTile(
                title: const Text('Science',style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: () {
                  ref.read(newsCategoryProvider.notifier).update((state) => 'science');
                  Navigator.pop(context); // Close drawer
                },
              ),
              ListTile(
                title: const Text('Health',style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: () {
                  ref.read(newsCategoryProvider.notifier).update((state) => 'health');
                  Navigator.pop(context); // Close drawer
                },
              ),
              ListTile(
                title: const Text('Entertainment',style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: () {
                  ref.read(newsCategoryProvider.notifier).update((state) => 'entertainment');
                  Navigator.pop(context); // Close drawer
                },
              ),
              ListTile(
                title: const Text('business',style: TextStyle(fontWeight: FontWeight.bold),),
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