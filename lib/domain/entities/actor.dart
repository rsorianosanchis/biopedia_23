

class Actor {
    final bool adult;
    final int gender;
    final int id;
    String ? knownForDepartment;
    final String name;
    final String originalName;
    final double popularity;
    final String ? profilePath;
    final int ? castId;
    final String ? character;
    final String creditId;
    final int ? order;
    

    Actor({
        required this.adult,
        required this.gender,
        required this.id,
        this.knownForDepartment,
        required this.name,
        required this.originalName,
        required this.popularity,
        required this.profilePath,
        this.castId,
        this.character,
        required this.creditId,
        this.order,
       
    });
}