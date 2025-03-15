import 'dart:convert';

ResultRace resultRaceFromJson(String str) =>
    ResultRace.fromJson(json.decode(str));

String resultRaceToJson(ResultRace data) => json.encode(data.toJson());

class ResultRace {
  String? api;
  String? url;
  int? limit;
  int? offset;
  int? total;
  String? season;
  Championship? championship;
  List<Race>? races;

  ResultRace({
    this.api,
    this.url,
    this.limit,
    this.offset,
    this.total,
    this.season,
    this.championship,
    this.races,
  });

  factory ResultRace.fromJson(Map<String, dynamic> json) => ResultRace(
    api: json["api"],
    url: json["url"],
    limit: json["limit"],
    offset: json["offset"],
    total: json["total"],
    season: json["season"],
    championship:
        json["championship"] == null
            ? null
            : Championship.fromJson(json["championship"]),
    races:
        json["races"] == null
            ? []
            : List<Race>.from(json["races"]!.map((x) => Race.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "api": api,
    "url": url,
    "limit": limit,
    "offset": offset,
    "total": total,
    "season": season,
    "championship": championship?.toJson(),
    "races":
        races == null ? [] : List<dynamic>.from(races!.map((x) => x.toJson())),
  };
}

class Championship {
  String? championshipId;
  String? championshipName;
  String? url;
  int? year;

  Championship({
    this.championshipId,
    this.championshipName,
    this.url,
    this.year,
  });

  factory Championship.fromJson(Map<String, dynamic> json) => Championship(
    championshipId: json["championshipId"],
    championshipName: json["championshipName"],
    url: json["url"],
    year: json["year"],
  );

  Map<String, dynamic> toJson() => {
    "championshipId": championshipId,
    "championshipName": championshipName,
    "url": url,
    "year": year,
  };
}

// enum ChampionshipId { F1_2025 }

// final championshipIdValues = EnumValues({"f1_2025": ChampionshipId.F1_2025});

class Race {
  String? raceId;
  String? championshipId;
  String? raceName;
  Schedule? schedule;
  int? laps;
  int? round;
  String? url;
  FastLap? fastLap;
  Circuit? circuit;
  Winner? winner;
  TeamWinner? teamWinner;

  Race({
    this.raceId,
    this.championshipId,
    this.raceName,
    this.schedule,
    this.laps,
    this.round,
    this.url,
    this.fastLap,
    this.circuit,
    this.winner,
    this.teamWinner,
  });

  factory Race.fromJson(Map<String, dynamic> json) => Race(
    raceId: json["raceId"],
    championshipId: json["championshipId"],
    raceName: json["raceName"],
    schedule:
        json["schedule"] == null ? null : Schedule.fromJson(json["schedule"]),
    laps: json["laps"],
    round: json["round"],
    url: json["url"],
    fastLap:
        json["fast_lap"] == null ? null : FastLap.fromJson(json["fast_lap"]),
    circuit: json["circuit"] == null ? null : Circuit.fromJson(json["circuit"]),
    winner: json["winner"] == null ? null : Winner.fromJson(json["winner"]),
    teamWinner:
        json["teamWinner"] == null
            ? null
            : TeamWinner.fromJson(json["teamWinner"]),
  );

  Map<String, dynamic> toJson() => {
    "raceId": raceId,
    "championshipId": championshipId,
    "raceName": raceName,
    "schedule": schedule?.toJson(),
    "laps": laps,
    "round": round,
    "url": url,
    "fast_lap": fastLap?.toJson(),
    "circuit": circuit?.toJson(),
    "winner": winner?.toJson(),
    "teamWinner": teamWinner?.toJson(),
  };
}

class Circuit {
  String? circuitId;
  String? circuitName;
  String? country;
  String? city;
  String? circuitLength;
  String? lapRecord;
  int? firstParticipationYear;
  int? corners;
  String? fastestLapDriverId;
  TeamId? fastestLapTeamId;
  int? fastestLapYear;
  String? url;

  Circuit({
    this.circuitId,
    this.circuitName,
    this.country,
    this.city,
    this.circuitLength,
    this.lapRecord,
    this.firstParticipationYear,
    this.corners,
    this.fastestLapDriverId,
    this.fastestLapTeamId,
    this.fastestLapYear,
    this.url,
  });

  factory Circuit.fromJson(Map<String, dynamic> json) => Circuit(
    circuitId: json["circuitId"],
    circuitName: json["circuitName"],
    country: json["country"],
    city: json["city"],
    circuitLength: json["circuitLength"],
    lapRecord: json["lapRecord"],
    firstParticipationYear: json["firstParticipationYear"],
    corners: json["corners"],
    fastestLapDriverId: json["fastestLapDriverId"],
    fastestLapTeamId: teamIdValues.map[json["fastestLapTeamId"]]!,
    fastestLapYear: json["fastestLapYear"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "circuitId": circuitId,
    "circuitName": circuitName,
    "country": country,
    "city": city,
    "circuitLength": circuitLength,
    "lapRecord": lapRecord,
    "firstParticipationYear": firstParticipationYear,
    "corners": corners,
    "fastestLapDriverId": fastestLapDriverId,
    "fastestLapTeamId": teamIdValues.reverse[fastestLapTeamId],
    "fastestLapYear": fastestLapYear,
    "url": url,
  };
}

enum TeamId { FERRARI, MCLAREN, MERCEDES, RED_BULL }

final teamIdValues = EnumValues({
  "ferrari": TeamId.FERRARI,
  "mclaren": TeamId.MCLAREN,
  "mercedes": TeamId.MERCEDES,
  "red_bull": TeamId.RED_BULL,
});

class FastLap {
  String? fastLap;
  String? fastLapDriverId;
  String? fastLapTeamId;

  FastLap({this.fastLap, this.fastLapDriverId, this.fastLapTeamId});

  factory FastLap.fromJson(Map<String, dynamic> json) => FastLap(
    fastLap: json["fast_lap"],
    fastLapDriverId: json["fast_lap_driver_id"],
    fastLapTeamId: json["fast_lap_team_id"],
  );

  Map<String, dynamic> toJson() => {
    "fast_lap": fastLap,
    "fast_lap_driver_id": fastLapDriverId,
    "fast_lap_team_id": fastLapTeamId,
  };
}

class Schedule {
  Fp1? race;
  Fp1? qualy;
  Fp1? fp1;
  Fp1? fp2;
  Fp1? fp3;
  Fp1? sprintQualy;
  Fp1? sprintRace;

  Schedule({
    this.race,
    this.qualy,
    this.fp1,
    this.fp2,
    this.fp3,
    this.sprintQualy,
    this.sprintRace,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    race: json["race"] == null ? null : Fp1.fromJson(json["race"]),
    qualy: json["qualy"] == null ? null : Fp1.fromJson(json["qualy"]),
    fp1: json["fp1"] == null ? null : Fp1.fromJson(json["fp1"]),
    fp2: json["fp2"] == null ? null : Fp1.fromJson(json["fp2"]),
    fp3: json["fp3"] == null ? null : Fp1.fromJson(json["fp3"]),
    sprintQualy:
        json["sprintQualy"] == null ? null : Fp1.fromJson(json["sprintQualy"]),
    sprintRace:
        json["sprintRace"] == null ? null : Fp1.fromJson(json["sprintRace"]),
  );

  Map<String, dynamic> toJson() => {
    "race": race?.toJson(),
    "qualy": qualy?.toJson(),
    "fp1": fp1?.toJson(),
    "fp2": fp2?.toJson(),
    "fp3": fp3?.toJson(),
    "sprintQualy": sprintQualy?.toJson(),
    "sprintRace": sprintRace?.toJson(),
  };
}

class Fp1 {
  DateTime? date;
  String? time;

  Fp1({this.date, this.time});

  factory Fp1.fromJson(Map<String, dynamic> json) => Fp1(
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "date":
        "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "time": time,
  };
}

class TeamWinner {
  TeamId? teamId;
  String? teamName;
  String? country;
  int? firstAppearance;
  int? constructorsChampionships;
  int? driversChampionships;
  String? url;

  TeamWinner({
    this.teamId,
    this.teamName,
    this.country,
    this.firstAppearance,
    this.constructorsChampionships,
    this.driversChampionships,
    this.url,
  });

  factory TeamWinner.fromJson(Map<String, dynamic> json) => TeamWinner(
    teamId: teamIdValues.map[json["teamId"]]!,
    teamName: json["teamName"],
    country: json["country"],
    firstAppearance: json["firstAppearance"],
    constructorsChampionships: json["constructorsChampionships"],
    driversChampionships: json["driversChampionships"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "teamId": teamIdValues.reverse[teamId],
    "teamName": teamName,
    "country": country,
    "firstAppearance": firstAppearance,
    "constructorsChampionships": constructorsChampionships,
    "driversChampionships": driversChampionships,
    "url": url,
  };
}

class Winner {
  String? driverId;
  String? name;
  String? surname;
  String? country;
  String? birthday;
  int? number;
  String? shortName;
  String? url;

  Winner({
    this.driverId,
    this.name,
    this.surname,
    this.country,
    this.birthday,
    this.number,
    this.shortName,
    this.url,
  });

  factory Winner.fromJson(Map<String, dynamic> json) => Winner(
    driverId: json["driverId"],
    name: json["name"],
    surname: json["surname"],
    country: json["country"],
    birthday: json["birthday"],
    number: json["number"],
    shortName: json["shortName"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "driverId": driverId,
    "name": name,
    "surname": surname,
    "country": country,
    "birthday": birthday,
    "number": number,
    "shortName": shortName,
    "url": url,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
