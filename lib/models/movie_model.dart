class MovieModel {
  int page;
  List<Result> results;

  MovieModel({this.results, this.page});

  factory MovieModel.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['results'] as List;
    print(list.runtimeType);
    List<Result> resultList = list.map((i) => Result.fromJson(i)).toList();
    return MovieModel(results: resultList);
  }
}

class Result {
  final String posterPath;
  final String title;
  final String backdropPath;
  final String rating;

  Result({this.posterPath, this.title, this.backdropPath, this.rating});

  Result.fromJson(Map<String, dynamic> json)
      : this.posterPath = json['poster_path'],
        this.title = json['title'],
        this.backdropPath = json['backdrop_path'],
        this.rating = json['vote_average'].toString();
}
