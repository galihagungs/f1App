import 'dart:convert';

import 'package:f1_app/model/Standings.dart';
import 'package:f1_app/model/season.dart';
import 'package:f1_app/model/standingsteam.dart';
import 'package:f1_app/service/url.dart';
import 'package:http/http.dart' as http;

class F1Api {
  Future<SeasonModel> getSeason() async {
    var client = http.Client();
    var uri = Uri.parse("${UrlData.url}/seasons");
    var res = await client.get(uri);

    if (res.statusCode == 200) {
      return SeasonModel.fromMap(jsonDecode(res.body));
    }

    return SeasonModel();
  }

  Future<StandingsModel> getDriverStandingbySeason(int year) async {
    var client = http.Client();
    var uri = Uri.parse("${UrlData.url}/$year/drivers-championship");
    var res = await client.get(uri);
    // print(res.body);

    if (res.statusCode == 200) {
      return StandingsModel.fromJson(jsonDecode(utf8.decode(res.bodyBytes)));
    }

    return StandingsModel();
  }

  Future<StandingsTeams> getTeamStandingbySeason(int year) async {
    var client = http.Client();
    var uri = Uri.parse("${UrlData.url}/$year/constructors-championship");
    var res = await client.get(uri);
    print(res.body);

    if (res.statusCode == 200) {
      return StandingsTeams.fromJson(jsonDecode(utf8.decode(res.bodyBytes)));
    }

    return StandingsTeams();
  }
}
