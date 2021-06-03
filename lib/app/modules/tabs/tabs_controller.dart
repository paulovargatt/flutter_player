import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_bus/flutter_event_bus/EventBus.dart';
import 'package:get/get.dart';
import 'package:get_app_flutter/app/global/store.dart';
import 'package:get_app_flutter/app/modules/tabs/tab2/tab2_controller.dart';
import 'package:get_app_flutter/app/routes/app_routes.dart';
import 'package:get_storage/get_storage.dart';

class TabsController extends GetxController {
  final storage = GetStorage();
  final eventBus = TabsChangeEvent;

  Color backgroundColorNav = Colors.white;
  RxInt selectedIndex = 0.obs;

  exitApp() {
    storage.erase();
    Get.offAllNamed(Routes.LOGIN);
  }

  changeTab(i) {
    selectedIndex.value = i;
    storeEventBus.publish(TabsChangeEvent(i));
  }

  
}
