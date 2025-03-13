import 'dart:convert';

import 'package:f1_app/model/season.dart';
import 'package:f1_app/service/url.dart';
import 'package:http/http.dart' as http;

class SeasonApi {
  Future<SeasonModel> getSeason() async {
    var client = http.Client();
    var uri = Uri.parse("${UrlData.url}/seasons");
    var res = await client.get(uri);

    if (res.statusCode == 200) {
      return SeasonModel.fromMap(jsonDecode(res.body));
    }

    return SeasonModel();
  }
}
