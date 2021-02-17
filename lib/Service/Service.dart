import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:movieapp/Constants/constants.dart';
import 'package:movieapp/models/DetailsModel.dart';
import 'package:movieapp/models/NowPlayingModel.dart';

class Service {
  /* get All NowPlaying */
  static getNowPlaying() async {
    var res = await http.get(
        "https://api.themoviedb.org/3/movie/now_playing?api_key=$api_key");

    var jsonResponse = convert.jsonDecode(res.body);
    NowPlayingModel nowPlayingModel = NowPlayingModel.fromJson(jsonResponse);
    return nowPlayingModel;
  }

/* get movie details */
  static movieDetails(int id) async {
    var res = await http
        .get("https://api.themoviedb.org/3/movie/$id?api_key=$api_key");

    var jsonResponse = convert.jsonDecode(res.body);
    MovieDetailsModel movieDetailsModel =
        MovieDetailsModel.fromJson(jsonResponse);
    return movieDetailsModel;
  }
}
