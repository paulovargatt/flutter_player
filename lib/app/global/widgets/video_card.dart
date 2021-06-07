import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app_flutter/app/global/widgets/action_sheet.dart';
import 'package:get_app_flutter/app/player/player_controller.dart';

class VideoCard extends StatelessWidget {
  final video;

  VideoCard({Key? key, required this.video}) : super(key: key);
  final player = Get.find<PlayerController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        player.setVideo(video);
        print(video.title);
      },
      child: Container(
        margin: EdgeInsets.only(right: 7.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: [
                Image.network(video.thumbnail, fit: BoxFit.cover, width: 1000),
              ],
            ),
            Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 3.0),
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                                child: Text(
                              video.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )),
                            Flexible(
                                child: Text(
                              video.description,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )),
                          ]),
                    ),
                    // ac
                    ActionSheetVideo(video: video)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
