class MoviesFromActor {
  List<Cast> cast;
  List<Cast> crew;
  int id;

  MoviesFromActor({
    required this.cast,
    required this.crew,
    required this.id,
  });

  factory MoviesFromActor.fromJson(Map<String, dynamic> json) =>
      MoviesFromActor(
        cast: (json["cast"] as List?)?.map((x) => Cast.fromJson(x)).toList() ??
            [],
        crew: (json["crew"] as List?)?.map((x) => Cast.fromJson(x)).toList() ??
            [],
        id: json["id"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "cast": cast.map((x) => x.toJson()).toList(),
        "crew": crew.map((x) => x.toJson()).toList(),
        "id": id,
      };
}

class Cast {
  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  OriginalLanguage originalLanguage;
  String? originalTitle;
  String overview;
  double popularity;
  String? posterPath;
  String? releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;
  String? character;
  String creditId;
  int? order;
  MediaType mediaType;
  List<OriginCountry>? originCountry;
  String? originalName;
  DateTime? firstAirDate;
  String? name;
  int? episodeCount;
  String? department;
  String? job;

  Cast({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title = "", // Valor predeterminado
    this.video = false, // Valor predeterminado
    required this.voteAverage,
    required this.voteCount,
    this.character,
    required this.creditId,
    this.order,
    required this.mediaType,
    this.originCountry,
    this.originalName,
    this.firstAirDate,
    this.name,
    this.episodeCount,
    this.department,
    this.job,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        adult: json["adult"] ?? false,
        backdropPath: json["backdrop_path"],
        genreIds:
            (json["genre_ids"] as List?)?.map((x) => x as int).toList() ?? [],
        id: json["id"] ?? 0,
        originalLanguage:
            originalLanguageValues.map[json["original_language"]] ??
                OriginalLanguage.EN,
        originalTitle: json["original_title"],
        overview: json["overview"] ?? "",
        popularity: (json["popularity"] ?? 0).toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"] ?? "",
        video: json["video"] ?? false,
        voteAverage: (json["vote_average"] ?? 0).toDouble(),
        voteCount: json["vote_count"] ?? 0,
        character: json["character"],
        creditId: json["credit_id"] ?? "",
        order: json["order"],
        mediaType: mediaTypeValues.map[json["media_type"]] ?? MediaType.MOVIE,
        originCountry: (json["origin_country"] as List?)
            ?.map((x) => originCountryValues.map[x] ?? OriginCountry.US)
            .toList(),
        originalName: json["original_name"],
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.tryParse(json["first_air_date"]),
        name: json["name"],
        episodeCount: json["episode_count"],
        department: json["department"],
        job: json["job"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": genreIds,
        "id": id,
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "character": character,
        "credit_id": creditId,
        "order": order,
        "media_type": mediaTypeValues.reverse[mediaType],
        "origin_country":
            originCountry?.map((x) => originCountryValues.reverse[x]).toList(),
        "original_name": originalName,
        "first_air_date": firstAirDate?.toIso8601String(),
        "name": name,
        "episode_count": episodeCount,
        "department": department,
        "job": job,
      };
}

enum MediaType { MOVIE, TV }

final mediaTypeValues =
    EnumValues({"movie": MediaType.MOVIE, "tv": MediaType.TV});

enum OriginCountry { DE, FR, GB, US }

final originCountryValues = EnumValues({
  "DE": OriginCountry.DE,
  "FR": OriginCountry.FR,
  "GB": OriginCountry.GB,
  "US": OriginCountry.US,
});

enum OriginalLanguage { DE, EN, FR, HU }

final originalLanguageValues = EnumValues({
  "de": OriginalLanguage.DE,
  "en": OriginalLanguage.EN,
  "fr": OriginalLanguage.FR,
  "hu": OriginalLanguage.HU,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
