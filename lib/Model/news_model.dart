class NewsModel
{
  String? author;
  String? title;
  String? description;

  NewsModel({this.author, this.title, this.description});

  NewsModel.fromJson(Map<String, dynamic> json)
  {
    author = json['author'];
    title = json['title'];
    description = json['description'];
  }

}