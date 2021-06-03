import 'package:get/get.dart';
import 'package:get_app_flutter/app/data/provider/news_provider.dart';
import 'package:get_app_flutter/app/modules/tabs/tab1/tab1_controller.dart';

class Tab1Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Tab1Controller>(() => Tab1Controller());
  Get.lazyPut<NewsProvider>(() => NewsProvider());
  }
}
