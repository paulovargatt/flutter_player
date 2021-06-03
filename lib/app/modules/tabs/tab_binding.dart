import 'package:get/get.dart';
import 'package:get_app_flutter/app/data/provider/api_provider.dart';
import 'package:get_app_flutter/app/data/provider/news_provider.dart';
import 'package:get_app_flutter/app/modules/tabs/tab1/tab1_binding.dart';
import 'package:get_app_flutter/app/modules/tabs/tab1/tab1_controller.dart';
import 'package:get_app_flutter/app/modules/tabs/tab2/tab2_controller.dart';
import 'package:get_app_flutter/app/modules/tabs/tabs_controller.dart';


class TabBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(() => TabsController());
    Get.lazyPut<Tab1Controller>(() => Tab1Controller());
    Get.lazyPut<Tab2Controller>(() => Tab2Controller());
    Get.lazyPut<NewsProvider>(() => NewsProvider());
    Get.lazyPut<ApiProvider>(() => ApiProvider());
  }
}
