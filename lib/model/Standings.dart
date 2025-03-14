import 'dart:convert';

StandingsModel driverModelFromJson(String str) =>
    StandingsModel.fromJson(json.decode(str));

String driverModelToJson(StandingsModel data) => json.encode(data.toJson());

class StandingsModel {
  String? api;
  String? url;
  int? limit;
  int? offset;
  int? total;
  String? season;
  String? championshipId;
  List<DriversChampionship>? driversChampionship;

  StandingsModel({
    this.api,
    this.url,
    this.limit,
    this.offset,
    this.total,
    this.season,
    this.championshipId,
    this.driversChampionship,
  });

  StandingsModel copyWith({
    String? api,
    String? url,
    int? limit,
    int? offset,
    int? total,
    String? season,
    String? championshipId,
    List<DriversChampionship>? driversChampionship,
  }) => StandingsModel(
    api: api ?? this.api,
    url: url ?? this.url,
    limit: limit ?? this.limit,
    offset: offset ?? this.offset,
    total: total ?? this.total,
    season: season ?? this.season,
    championshipId: championshipId ?? this.championshipId,
    driversChampionship: driversChampionship ?? this.driversChampionship,
  );

  factory StandingsModel.fromJson(Map<String, dynamic> json) => StandingsModel(
    api: json["api"],
    url: json["url"],
    limit: json["limit"],
    offset: json["offset"],
    total: json["total"],
    season: json["season"],
    championshipId: json["championshipId"],
    driversChampionship:
        json["drivers_championship"] == null
            ? []
            : List<DriversChampionship>.from(
              json["drivers_championship"]!.map(
                (x) => DriversChampionship.fromJson(x),
              ),
            ),
  );

  Map<String, dynamic> toJson() => {
    "api": api,
    "url": url,
    "limit": limit,
    "offset": offset,
    "total": total,
    "season": season,
    "championshipId": championshipId,
    "drivers_championship":
        driversChampionship == null
            ? []
            : List<dynamic>.from(driversChampionship!.map((x) => x.toJson())),
  };
}

class DriversChampionship {
  int? classificationId;
  String? driverId;
  String? teamId;
  double? points;
  int? position;
  int? wins;
  Driver? driver;
  Team? team;

  DriversChampionship({
    this.classificationId,
    this.driverId,
    this.teamId,
    this.points,
    this.position,
    this.wins,
    this.driver,
    this.team,
  });

  DriversChampionship copyWith({
    int? classificationId,
    String? driverId,
    String? teamId,
    double? points,
    int? position,
    int? wins,
    Driver? driver,
    Team? team,
  }) => DriversChampionship(
    classificationId: classificationId ?? this.classificationId,
    driverId: driverId ?? this.driverId,
    teamId: teamId ?? this.teamId,
    points: points ?? this.points,
    position: position ?? this.position,
    wins: wins ?? this.wins,
    driver: driver ?? this.driver,
    team: team ?? this.team,
  );

  factory DriversChampionship.fromJson(Map<String, dynamic> json) =>
      DriversChampionship(
        classificationId: json["classificationId"],
        driverId: json["driverId"],
        teamId: json["teamId"],
        points: json["points"]?.toDouble(),
        position: json["position"],
        wins: json["wins"],
        driver: json["driver"] == null ? null : Driver.fromJson(json["driver"]),
        team: json["team"] == null ? null : Team.fromJson(json["team"]),
      );

  Map<String, dynamic> toJson() => {
    "classificationId": classificationId,
    "driverId": driverId,
    "teamId": teamId,
    "points": points,
    "position": position,
    "wins": wins,
    "driver": driver?.toJson(),
    "team": team?.toJson(),
  };
}

class Driver {
  String? name;
  String? surname;
  String? nationality;
  String? birthday;
  int? number;
  String? shortName;
  String? url;

  Driver({
    this.name,
    this.surname,
    this.nationality,
    this.birthday,
    this.number,
    this.shortName,
    this.url,
  });

  Driver copyWith({
    String? name,
    String? surname,
    String? nationality,
    String? birthday,
    int? number,
    String? shortName,
    String? url,
  }) => Driver(
    name: name ?? this.name,
    surname: surname ?? this.surname,
    nationality: nationality ?? this.nationality,
    birthday: birthday ?? this.birthday,
    number: number ?? this.number,
    shortName: shortName ?? this.shortName,
    url: url ?? this.url,
  );

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
    name: json["name"],
    surname: json["surname"],
    nationality: json["nationality"],
    birthday: json["birthday"],
    number: json["number"],
    shortName: json["shortName"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "surname": surname,
    "nationality": nationality,
    "birthday": birthday,
    "number": number,
    "shortName": shortName,
    "url": url,
  };
}

class Team {
  String? teamId;
  String? teamName;
  String? country;
  int? firstAppareance;
  int? constructorsChampionships;
  int? driversChampionships;
  String? url;

  Team({
    this.teamId,
    this.teamName,
    this.country,
    this.firstAppareance,
    this.constructorsChampionships,
    this.driversChampionships,
    this.url,
  });

  Team copyWith({
    String? teamId,
    String? teamName,
    String? country,
    int? firstAppareance,
    int? constructorsChampionships,
    int? driversChampionships,
    String? url,
  }) => Team(
    teamId: teamId ?? this.teamId,
    teamName: teamName ?? this.teamName,
    country: country ?? this.country,
    firstAppareance: firstAppareance ?? this.firstAppareance,
    constructorsChampionships:
        constructorsChampionships ?? this.constructorsChampionships,
    driversChampionships: driversChampionships ?? this.driversChampionships,
    url: url ?? this.url,
  );

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    teamId: json["teamId"],
    teamName: json["teamName"],
    country: json["country"],
    firstAppareance: json["firstAppareance"],
    constructorsChampionships: json["constructorsChampionships"],
    driversChampionships: json["driversChampionships"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "teamId": teamId,
    "teamName": teamName,
    "country": country,
    "firstAppareance": firstAppareance,
    "constructorsChampionships": constructorsChampionships,
    "driversChampionships": driversChampionships,
    "url": url,
  };
}
