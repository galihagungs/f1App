import 'dart:convert';

TeamModel teamModelFromJson(String str) => TeamModel.fromJson(json.decode(str));

String teamModelToJson(TeamModel data) => json.encode(data.toJson());

class TeamModel {
  String? api;
  String? url;
  int? limit;
  int? offset;
  int? total;
  String? season;
  String? championshipId;
  List<Team>? teams;

  TeamModel({
    this.api,
    this.url,
    this.limit,
    this.offset,
    this.total,
    this.season,
    this.championshipId,
    this.teams,
  });

  TeamModel copyWith({
    String? api,
    String? url,
    int? limit,
    int? offset,
    int? total,
    String? season,
    String? championshipId,
    List<Team>? teams,
  }) => TeamModel(
    api: api ?? this.api,
    url: url ?? this.url,
    limit: limit ?? this.limit,
    offset: offset ?? this.offset,
    total: total ?? this.total,
    season: season ?? this.season,
    championshipId: championshipId ?? this.championshipId,
    teams: teams ?? this.teams,
  );

  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
    api: json["api"],
    url: json["url"],
    limit: json["limit"],
    offset: json["offset"],
    total: json["total"],
    season: json["season"],
    championshipId: json["championshipId"],
    teams:
        json["teams"] == null
            ? []
            : List<Team>.from(json["teams"]!.map((x) => Team.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "api": api,
    "url": url,
    "limit": limit,
    "offset": offset,
    "total": total,
    "season": season,
    "championshipId": championshipId,
    "teams":
        teams == null ? [] : List<dynamic>.from(teams!.map((x) => x.toJson())),
  };
}

class Team {
  String? teamId;
  String? teamName;
  String? teamNationality;
  int? firstAppeareance;
  int? constructorsChampionships;
  int? driversChampionships;
  String? url;

  Team({
    this.teamId,
    this.teamName,
    this.teamNationality,
    this.firstAppeareance,
    this.constructorsChampionships,
    this.driversChampionships,
    this.url,
  });

  Team copyWith({
    String? teamId,
    String? teamName,
    String? teamNationality,
    int? firstAppeareance,
    int? constructorsChampionships,
    int? driversChampionships,
    String? url,
  }) => Team(
    teamId: teamId ?? this.teamId,
    teamName: teamName ?? this.teamName,
    teamNationality: teamNationality ?? this.teamNationality,
    firstAppeareance: firstAppeareance ?? this.firstAppeareance,
    constructorsChampionships:
        constructorsChampionships ?? this.constructorsChampionships,
    driversChampionships: driversChampionships ?? this.driversChampionships,
    url: url ?? this.url,
  );

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    teamId: json["teamId"],
    teamName: json["teamName"],
    teamNationality: json["teamNationality"],
    firstAppeareance: json["firstAppeareance"],
    constructorsChampionships: json["constructorsChampionships"],
    driversChampionships: json["driversChampionships"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "teamId": teamId,
    "teamName": teamName,
    "teamNationality": teamNationality,
    "firstAppeareance": firstAppeareance,
    "constructorsChampionships": constructorsChampionships,
    "driversChampionships": driversChampionships,
    "url": url,
  };
}
