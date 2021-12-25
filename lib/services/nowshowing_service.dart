import 'package:bahas_movie/models/nowshowing_model.dart';
import 'package:bahas_movie/services/popular_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NowShowingService {
  Uri basedUrl = Uri.parse(
      'https://api.themoviedb.org/3/movie/now_playing?api_key=${PopularService.apiKey}&language=en-US&page=1');

  Future<List<NowShowing>> fetchNowShowing() async {
    var respone = await http.get(basedUrl);
    if (respone.statusCode == 200) {
      List<dynamic> body = json.decode(respone.body)['results'];
      List<NowShowing> nowShowing =
          body.map((nowShowing) => NowShowing.fromJson(nowShowing)).toList();
      return nowShowing;
    } else {
      throw Exception('Tidak Dapat Get Data');
    }
  }
}
