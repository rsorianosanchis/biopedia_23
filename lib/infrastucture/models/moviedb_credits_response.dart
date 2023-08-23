import 'dart:convert';
import 'cast_movidb.dart';

MovieDbCreditsResponse movieDbCreditsResponseFromJson(String str) =>
    MovieDbCreditsResponse.fromJson(json.decode(str));

String movieDbCreditsResponseToJson(MovieDbCreditsResponse data) =>
    json.encode(data.toJson());

class MovieDbCreditsResponse {
  final int id;
  final List<CastMovieDb> cast;
  final List<CastMovieDb> crew;

  MovieDbCreditsResponse({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory MovieDbCreditsResponse.fromJson(Map<String, dynamic> json) =>
      MovieDbCreditsResponse(
        id: json["id"],
        cast: List<CastMovieDb>.from(
            json["cast"].map((x) => CastMovieDb.fromJson(x))),
        crew: List<CastMovieDb>.from(
            json["crew"].map((x) => CastMovieDb.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
        "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
      };
}
