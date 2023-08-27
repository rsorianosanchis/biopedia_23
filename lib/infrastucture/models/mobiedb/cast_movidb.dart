class CastMovieDb {
    final bool adult;
    final int gender;
    final int id;
    final String? knownForDepartment;
    final String name;
    final String originalName;
    final double popularity;
    final String ? profilePath;
    final int ? castId;
    final String ? character;
    final String creditId;
    final int ? order;
    final String? department;
    final String? job;

    CastMovieDb({
        required this.adult,
        required this.gender,
        required this.id,
        this.knownForDepartment,
        required this.name,
        required this.originalName,
        required this.popularity,
        this.profilePath,
        this.castId,
        this.character,
        required this.creditId,
        this.order,
        this.department,
        this.job,
    });

    factory CastMovieDb.fromJson(Map<String, dynamic> json) => CastMovieDb(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["knownForDepartment"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"],
        castId: json["cast_id"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
        department: json["department"],
        job: json["job"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath,
        "cast_id": castId,
        "character": character,
        "credit_id": creditId,
        "order": order,
        "department": department,
        "job": job,
    };
}