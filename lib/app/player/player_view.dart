import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_app_flutter/app/player/player_controller.dart';

class PlayerView extends StatelessWidget {
  PlayerView({Key? key, required this.height}) : super(key: key);
  var player = Get.find<PlayerController>();
  final height;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Scaffold(
        body: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverToBoxAdapter(
                child: Obx(() => SafeArea(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              // BetterPlayer(
                              //   controller: player.betterPlayerController,
                              // ),
                              IconButton(
                                  onPressed: () => {
                                        //
                                      },
                                  icon: Icon(Icons.keyboard_arrow_down)),
                            ],
                          ),

                          //VideoInfo(video: selectedVideo),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
