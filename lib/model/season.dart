import 'dart:convert';

SeasonModel seasonModelFromMap(String str) =>
    SeasonModel.fromMap(json.decode(str));

String seasonModelToMap(SeasonModel data) => json.encode(data.toMap());

class SeasonModel {
  final String? api;
  final String? url;
  final int? limit;
  final int? offset;
  final int? total;
  final List<Championship>? championships;

  SeasonModel({
    this.api,
    this.url,
    this.limit,
    this.offset,
    this.total,
    this.championships,
  });

  factory SeasonModel.fromMap(Map<String, dynamic> json) => SeasonModel(
    api: json["api"],
    url: json["url"],
    limit: json["limit"],
    offset: json["offset"],
    total: json["total"],
    championships:
        json["championships"] == null
            ? []
            : List<Championship>.from(
              json["championships"]!.map((x) => Championship.fromMap(x)),
            ),
  );

  Map<String, dynamic> toMap() => {
    "api": api,
    "url": url,
    "limit": limit,
    "offset": offset,
    "total": total,
    "championships":
        championships == null
            ? []
            : List<dynamic>.from(championships!.map((x) => x.toMap())),
  };
}

class Championship {
  final String? championshipId;
  final String? championshipName;
  final String? url;
  final int? year;

  Championship({
    this.championshipId,
    this.championshipName,
    this.url,
    this.year,
  });

  factory Championship.fromMap(Map<String, dynamic> json) => Championship(
    championshipId: json["championshipId"],
    championshipName: json["championshipName"],
    url: json["url"],
    year: json["year"],
  );

  Map<String, dynamic> toMap() => {
    "championshipId": championshipId,
    "championshipName": championshipName,
    "url": url,
    "year": year,
  };
}
