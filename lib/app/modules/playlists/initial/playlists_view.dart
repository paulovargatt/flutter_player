import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app_flutter/app/global/widgets/miniplayer.dart';
import 'package:get_app_flutter/app/modules/initial/initial_controller.dart';
import 'package:get_app_flutter/app/modules/tabs/tab1/tab1.dart';
import 'package:get_app_flutter/app/modules/tabs/tab_view.dart';
import 'package:get_app_flutter/app/player/player_controller.dart';

final player = Get.find<PlayerController>();

class PlaylistsPage extends GetView<InitialController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.to(TabPage()),
        ),
        title: Text("Sample"),
        centerTitle: true,
      ),
      body: Obx(() => Stack(
            children: [
              Container(
                child: Text('OK'),
              ),
              Offstage(
                  offstage: player.selectedVideo.value.id == 0,
                  child: MiniPlayerPerson())
            ],
          )),
    );
  }
}
