import 'dart:convert';

StandingsTeams standingsTeamsFromJson(String str) =>
    StandingsTeams.fromJson(json.decode(str));

String standingsTeamsToJson(StandingsTeams data) => json.encode(data.toJson());

class StandingsTeams {
  String? api;
  String? url;
  int? limit;
  int? offset;
  int? total;
  String? season;
  String? championshipId;
  List<ConstructorsChampionship>? constructorsChampionship;

  StandingsTeams({
    this.api,
    this.url,
    this.limit,
    this.offset,
    this.total,
    this.season,
    this.championshipId,
    this.constructorsChampionship,
  });

  factory StandingsTeams.fromJson(Map<String, dynamic> json) => StandingsTeams(
    api: json["api"],
    url: json["url"],
    limit: json["limit"],
    offset: json["offset"],
    total: json["total"],
    season: json["season"],
    championshipId: json["championshipId"],
    constructorsChampionship:
        json["constructors_championship"] == null
            ? []
            : List<ConstructorsChampionship>.from(
              json["constructors_championship"]!.map(
                (x) => ConstructorsChampionship.fromJson(x),
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
    "constructors_championship":
        constructorsChampionship == null
            ? []
            : List<dynamic>.from(
              constructorsChampionship!.map((x) => x.toJson()),
            ),
  };
}

class ConstructorsChampionship {
  int? classificationId;
  String? teamId;
  double? points;
  int? position;
  int? wins;
  Team? team;

  ConstructorsChampionship({
    this.classificationId,
    this.teamId,
    this.points,
    this.position,
    this.wins,
    this.team,
  });

  factory ConstructorsChampionship.fromJson(Map<String, dynamic> json) =>
      ConstructorsChampionship(
        classificationId: json["classificationId"],
        teamId: json["teamId"],
        points: json["points"]?.toDouble(),
        position: json["position"],
        wins: json["wins"],
        team: json["team"] == null ? null : Team.fromJson(json["team"]),
      );

  Map<String, dynamic> toJson() => {
    "classificationId": classificationId,
    "teamId": teamId,
    "points": points,
    "position": position,
    "wins": wins,
    "team": team?.toJson(),
  };
}

class Team {
  String? teamName;
  String? country;
  int? firstAppareance;
  int? constructorsChampionships;
  int? driversChampionships;
  String? url;

  Team({
    this.teamName,
    this.country,
    this.firstAppareance,
    this.constructorsChampionships,
    this.driversChampionships,
    this.url,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    teamName: json["teamName"],
    country: json["country"],
    firstAppareance: json["firstAppareance"],
    constructorsChampionships: json["constructorsChampionships"],
    driversChampionships: json["driversChampionships"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "teamName": teamName,
    "country": country,
    "firstAppareance": firstAppareance,
    "constructorsChampionships": constructorsChampionships,
    "driversChampionships": driversChampionships,
    "url": url,
  };
}
