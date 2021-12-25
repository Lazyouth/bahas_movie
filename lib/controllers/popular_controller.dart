import 'package:bahas_movie/models/popular_model.dart';
import 'package:bahas_movie/services/popular_service.dart';
import 'package:get/get.dart';

class PopularController extends GetxController {
  var popularList = <PopularModel>[].obs;

  Future fetchPopular() async {
    List<PopularModel> popular = await PopularService().fetchPopular();
    if (popular.isNotEmpty) {
      popularList.value = popular;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchPopular();
  }
}
