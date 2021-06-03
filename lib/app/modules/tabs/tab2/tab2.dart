import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app_flutter/app/modules/tabs/tab2/tab2_controller.dart';

class Tab2Page extends GetView<Tab2Controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()  {
          controller.clearData();
          controller.loadNews();
        },
        label: Text('Add'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.listNews.length,
          itemBuilder: (context, index) {
            final item = controller.listNews[index];
            return Column(
              children: [
                Stack(
                  children: [
                    Image.network(
                      item.thumbnailLarge,
                      height: 250.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 8.0,
                      right: 8.0,
                      child: Container(
                        color: Colors.black,
                        child: Text(item.title,
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 8.0),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                    child: Text(
                                  item.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )),
                                Flexible(
                                    child: Text(
                                  '${item.description}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )),
                              ]),
                        ),
                        GestureDetector(
                          onTap: () => {},
                          child: Icon(Icons.more_vert, size: 20.0),
                        )
                      ],
                    ))
              ],
            );
          },
        ),
      ),
    );
  }
}
