import 'package:better_player/better_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_app_flutter/app/data/models/video_model.dart';
import 'package:miniplayer/miniplayer.dart';

class PlayerController extends GetxController {
  RxInt videoId = 0.obs;
  RxString videoTitle = ''.obs;
  RxString videoImage = ''.obs;

  var selectedVideo = VideoModel().obs;

  BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8',
      videoFormat: BetterPlayerVideoFormat.hls);
  var _betterPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(
          aspectRatio: 16 / 9,
          fit: BoxFit.contain,
          autoDetectFullscreenDeviceOrientation: true));

  get ctrlPlayer => this._betterPlayerController;
  // var betterPlayerController = BetterPlayerController(
  //     BetterPlayerConfiguration(autoPlay: true,
  //         autoDispose: true,
  //         aspectRatio: 16 / 9));

  // final myMap = RxMap<Video>({});
//  final myMap = RxMap<String, int>({});

  final miniPlayerCtrl = MiniplayerController();

  changeMiniPlayer(type) {
    if (type == 'min') {
      return miniPlayerCtrl.animateToHeight(state: PanelState.MIN);
    } else {
      return miniPlayerCtrl.animateToHeight(state: PanelState.MAX);
    }
  }

  onVisibilityChanged(double visibleFraction) async {
    return false;
  }

  setVideo(VideoModel video) {
    selectedVideo.value = video;
    this.changeMiniPlayer('max');
    print('chamou aki');
    this.initPlayer(selectedVideo.value.videoStreaming);

    // videoTitle.value = video.title;
    // videoImage.value = video.thumbnailUrl;
  }

  initPlayer(url) {
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
        
            autoPlay: true,
            aspectRatio: 16 / 9,
            fit: BoxFit.scaleDown,
            controlsConfiguration: BetterPlayerControlsConfiguration(showControls: false),
                        
            autoDetectFullscreenDeviceOrientation: true);
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network, url,
        videoFormat: BetterPlayerVideoFormat.hls);
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
    
  }

  closePlayer() {

    _betterPlayerController.dispose();
    selectedVideo.value = VideoModel();
  }
}
