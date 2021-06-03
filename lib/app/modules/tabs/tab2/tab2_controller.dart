import 'package:flutter_event_bus/flutter_event_bus/EventBus.dart';
import 'package:get/get.dart';
import 'package:get_app_flutter/app/data/models/news_model.dart';
import 'package:get_app_flutter/app/data/provider/news_provider.dart';
import 'package:get_app_flutter/app/global/store.dart';
import 'package:get_app_flutter/app/modules/tabs/tabs_controller.dart';

class Tab2Controller extends GetxController {
  final title = 'asdasd';
  final eventBus = TabsChangeEvent;

  var listNews = <NewsModel>[].obs;
  var loaded = false;
  final news = Get.find<NewsProvider>();

  @override
  void onInit() {
    print('initted');
    controlTabActive();
    super.onInit();
  }

  controlTabActive() {
    storeEventBus.respond((TabsChangeEvent event) => {getDataEvents(event)});
  }

  getDataEvents(event) {
    if (event.indexTab == 1) {
      loadNews();
    }
  }

  clearData(){
    loaded = false;
    listNews.clear();
  }

  loadNews() async {
    if (loaded) {
      return;
    }
    var data = await news.getNews(15, 2);
    loaded = true;
    data.forEach((e) {
      listNews.add(NewsModel.fromJson(e));
    });
  }
}
