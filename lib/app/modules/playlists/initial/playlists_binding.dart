import 'package:get/get.dart';
import 'package:get_app_flutter/app/modules/playlists/initial/playlists_controller.dart';
import 'package:get_app_flutter/app/player/player_controller.dart';

class PlaylistsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayerController>(() => PlayerController());
    Get.lazyPut<PlaylistsController>(() => PlaylistsController());
  }
}
