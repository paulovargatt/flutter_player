import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app_flutter/app/modules/tabs/tab1/tab1.dart';
import 'package:get_app_flutter/app/modules/tabs/tab2/tab2.dart';
import 'package:get_app_flutter/app/modules/tabs/tab3.dart';
import 'package:get_app_flutter/app/modules/tabs/tabs_controller.dart';
import 'package:get_app_flutter/app/player/player_controller.dart';
import 'package:get_app_flutter/app/player/player_view.dart';
import 'package:miniplayer/miniplayer.dart';

final player = Get.find<PlayerController>();

class TabPage extends GetView<TabsController> {
  @override
  final _screens = [Tab1Page(), Tab2Page(), Tab3()];
  static const double _playerMinHeight = 58.0;

  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
          () => Stack(
            children: _screens
                .asMap()
                .map((i, screen) => MapEntry(
                      i,
                      Offstage(
                        offstage: controller.selectedIndex.value != i,
                        child: screen,
                      ),
                    ))
                .values
                .toList()
                  ..add(Offstage(
                    offstage: player.selectedVideo.value.id == 0,
                    child: Miniplayer(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                          width: height > 90
                                              ? width
                                              : maxImgSize - 58,
                                              
                                          child: BetterPlayer(
                                              controller: player.ctrlPlayer)),
                                      SizedBox(
                                        width: height > 60 ? 0 : width - 200,
                                        child: Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 15),
                                            child: Opacity(
                                              opacity: elementOpacity,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                      player.selectedVideo.value
                                                          .title,
                                                      maxLines: 1,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2!
                                                          .copyWith(
                                                              fontSize: 16)),
                                                  Text(
                                                    player.selectedVideo.value
                                                        .description,
                                                    maxLines: 1,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2!
                                                        .copyWith(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.55)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: height > 90 ? 0 : 70,
                                        height: maxImgSize - 10,
                                        child: IconButton(
                                            icon: Icon(Icons.fullscreen),
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
                    ),
                  )),
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.selectedIndex.value,
            backgroundColor: Get.theme.primaryColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white54,
            selectedFontSize: 10.0,
            showUnselectedLabels: false,
            unselectedFontSize: 9.0,
            onTap: (i) => {controller.changeTab(i)},
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined),
                activeIcon: Icon(Icons.explore),
                label: 'TAB 2',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                activeIcon: Icon(Icons.add_circle),
                label: 'TAB 3',
              )
            ],
          ),
        ));
  }
}
