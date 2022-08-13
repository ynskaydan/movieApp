import 'dart:convert';

import 'package:http/http.dart' as http;

class MoviesProvider {
  static const String imagePathPrefix = 'https://image.tmdb.org/t/p/w500/';

  static Future<Map> getJson() async {
    const apiKey = "7316a9d025957d06166c3e6d5a9e6c1b";
    const apiEndPoint =
        "http://api.themoviedb.org/3/discover/movie?api_key=${apiKey}&sort_by=popularity.desc";
    final apiResponse = await http.get(apiEndPoint);
    return json.decode(apiResponse.body);
  }
}
