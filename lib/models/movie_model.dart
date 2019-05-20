class MovieModel {
  List<Result> results;

  MovieModel({this.results});

  // factory MovieModel.fromJson(List<dynamic> parsedJson) {
  //   List<Result> results = new List<Result>();
  //   results = parsedJson.map((i) => Result.fromJson(i)).toList();
  //   return new MovieModel(
  //     results: results,
  //   );
  // }
  factory MovieModel.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['results'] as List;
    print(list.runtimeType);
    List<Result> resultList = list.map((i) => Result.fromJson(i)).toList();
    return MovieModel(results: resultList);
  }
}

class Result {
  String posterPath;
  String originalTitle;

  Result({this.posterPath, this.originalTitle});

  factory Result.fromJson(Map<String, dynamic> json) {
    return new Result(
      posterPath: json['poster_path'],
      originalTitle: json['original_title'],
    );
  }
}
