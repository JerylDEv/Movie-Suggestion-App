class MovieModel {
  List<Result> results;

  MovieModel({this.results});

  factory MovieModel.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['results'] as List;
    print(list.runtimeType);
    List<Result> resultList = list.map((i) => Result.fromJson(i)).toList();
    return MovieModel(results: resultList);
  }
}

class Result {
  final String posterPath;
  final String originalTitle;

  Result({this.posterPath, this.originalTitle});

  Result.fromJson(Map<String, dynamic> json)
      : this.posterPath = json['poster_path'],
        originalTitle = json['original_title'];
}
