import 'package:bahas_movie/models/nowshowing_model.dart';
import 'package:bahas_movie/services/nowshowing_service.dart';
import 'package:get/get.dart';

class NowShowingController extends GetxController {
  static const String basedImageUrl = 'https://image.tmdb.org/t/p/w500';
  var nowShowingList = <NowShowing>[].obs;

  Future<void> getNowShowing() async {
    List<NowShowing> nowShowing = await NowShowingService().fetchNowShowing();
    if (nowShowing.isNotEmpty) {
      nowShowingList.value = nowShowing;
    }
  }

  @override
  void onInit() {
    getNowShowing();
    super.onInit();
  }
}
