class NewsModel {
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? articleUrl;

  NewsModel({this.title, this.description, this.urlToImage, this.articleUrl});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      articleUrl: json['url'],
    );
  }
}