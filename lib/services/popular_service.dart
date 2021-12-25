import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/popular_model.dart';

class PopularService {
  static String apiKey = '116b86f10dbd93416fcea53981105212';
  Uri basedUrl = Uri.parse(
      'https://api.themoviedb.org/3/movie/popular?api_key=${apiKey}&language=en-US');

  Future<List<PopularModel>> fetchPopular() async {
    var response = await http.get(basedUrl);
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['results'];
      print(data);
      List<PopularModel> popular =
          data.map((popular) => PopularModel.fromJson(popular)).toList();
      return popular;
    } else {
      throw Exception('Gagal Get Data');
    }
  }
}
