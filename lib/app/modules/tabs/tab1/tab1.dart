import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app_flutter/app/data/provider/news_provider.dart';
import 'package:get_app_flutter/app/global/widgets/video_card.dart';
import 'package:get_app_flutter/app/modules/tabs/tab1/tab1_controller.dart';

class Tab1Page extends GetView<Tab1Controller> {
  final news = Get.find<NewsProvider>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Container(
          child: Column(
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  height: 305.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  aspectRatio: 2.0,
                ),
                 items: controller.slides.map((card){
                return Builder(
                  builder:(BuildContext context){
                    return Container(
                      height: MediaQuery.of(context).size.height*0,
                      width: MediaQuery.of(context).size.width,
                      child: VideoCard(video: card),
                    );
                  }
                );
              }).toList(),
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    controller.map<Widget>(controller.slides, (index, url) {
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.slides == index
                          ? Colors.blueAccent
                          : Colors.grey,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class Item1 extends StatelessWidget {
  final video;
  const Item1({Key ?key, this.video}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 1],
          colors: [Color(0xffff4000),Color(0xffffcc66),]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
                video.thumbnail,
                
              ),
        
        ],
      ),
    );
  }
}