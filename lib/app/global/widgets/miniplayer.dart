import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app_flutter/app/player/player_controller.dart';
import 'package:miniplayer/miniplayer.dart';

final player = Get.find<PlayerController>();

class MiniPlayerPerson extends StatelessWidget {
  const MiniPlayerPerson({Key? key}) : super(key: key);
  static const double _playerMinHeight = 58.0;

  @override
  Widget build(BuildContext context) {
    return Miniplayer(
      controller: player.miniPlayerCtrl,
      maxHeight: MediaQuery.of(context).size.height,
      minHeight: _playerMinHeight,
      elevation: 4,
      curve: Curves.easeOut,
      builder: (height, percentage) {
        final double width = MediaQuery.of(context).size.width;
        final maxImgSize = width * 0.4;
        // if (player.selectedVideo.value.id == 0) {
        //   return SizedBox.shrink();
        // }
        // (height <= _playerMinHeight + 50),
        final elementOpacity = 1 - 1 * percentage;

        return Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                          width: height > 90 ? width : maxImgSize - 58,
                          child: BetterPlayer(controller: player.ctrlPlayer)),
                      SizedBox(
                        width: height > 60 ? 0 : 200,
                        child: Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 7),
                            child: Opacity(
                              opacity: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(player.selectedVideo.value.title,
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(fontSize: 16)),
                                  Text(
                                    player.selectedVideo.value.description,
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                            color:
                                                Colors.black.withOpacity(0.55)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: height > 90 ? 0 : 50,
                        height: maxImgSize - 10,
                        child: IconButton(
                            icon: Icon(Icons.play_arrow_rounded),
                            onPressed: () {
                              player.closePlayer();
                            }),
                      ),
                      SizedBox(
                        width: height > 90 ? 0 : 50,
                        height: maxImgSize - 10,
                        child: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              player.closePlayer();
                            }),
                      ),
                    ],
                  ),

                  //Image.network(
                  //    player.selectedVideo.value.thumbnail),

                  // IconButton(
                  //     icon: Icon(Icons.fullscreen),
                  //     onPressed: () {
                  //       player.changeMiniPlayer('max');
                  //     }),
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 3),
                  //   // child: Opacity(
                  //   //   opacity: elementOpacity,
                  //   //   child: //buttonPlay,
                  //   // ),
                  // ),
                ],
              ),
            ),
            // SizedBox(
            //   height: progressIndicatorHeight,
            //   child: Opacity(
            //     opacity: elementOpacity,
            //     child: progressIndicator,
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
