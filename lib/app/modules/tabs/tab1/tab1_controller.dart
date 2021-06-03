import 'package:get/get.dart';
import 'package:get_app_flutter/app/data/models/news_model.dart';
import 'package:get_app_flutter/app/data/models/video_model.dart';
import 'package:get_app_flutter/app/data/provider/api_provider.dart';
import 'package:get_app_flutter/app/data/provider/news_provider.dart';

class Tab1Controller extends GetxController {
  var slides = <VideoModel>[].obs;
  final api = Get.find<ApiProvider>();

  

  @override
  void onInit() {
    loadNews();
    print('call');
    super.onInit();
  }

  loadNews() async {
    var data = await api.getHomeData();
    data.forEach((e) {
      slides.add(VideoModel.fromJson(e));
    });
  }

   List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
}


