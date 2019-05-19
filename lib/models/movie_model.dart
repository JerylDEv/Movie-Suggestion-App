class MovieModel {
  int id;
  String url;
  String title;

  MovieModel({this.id, this.url, this.title});

  MovieModel.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        url = parsedJson['url'],
        title = parsedJson['title'];
}
