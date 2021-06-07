import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app_flutter/app/global/widgets/miniplayer.dart';
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
                    child: MiniPlayerPerson()
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
