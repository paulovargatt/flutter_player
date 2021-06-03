// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_app_flutter/app/modules/tabs/tabs_controller.dart';

// class TabNavigation extends StatelessWidget {
//   final controller = Get.find<TabsController>();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 56,
//       padding: EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 8),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)]),
//       width: Get.width,
//       child: Obx(
//         () => Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: controller.items.map((item) {
//             var itemIndex = controller.items.indexOf(item);
//             return GestureDetector(
//               onTap: () {
//                 controller.choiceIndex(itemIndex);
//               },
//               child: AnimatedContainer(
//                 duration: Duration(milliseconds: 250),
//                 height: 50,
//                 width: controller.selectedIndex.value == itemIndex ? 120 : 50,
//                 padding: controller.selectedIndex.value == itemIndex
//                     ? EdgeInsets.only(left: 16, right: 16)
//                     : null,
//                 decoration: controller.selectedIndex.value == itemIndex
//                     ? BoxDecoration(
//                         color: item.color,
//                         borderRadius: BorderRadius.all(Radius.circular(50)))
//                     : null,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: <Widget>[
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         IconTheme(
//                           data: IconThemeData(
//                             size: 24,
//                             color: controller.selectedIndex.value == itemIndex
//                                 ? controller.backgroundColorNav
//                                 : Colors.black,
//                           ),
//                           child: item.icon,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 8),
//                           child: controller.selectedIndex.value == itemIndex
//                               ? DefaultTextStyle.merge(
//                                   style: TextStyle(
//                                       color: controller.backgroundColorNav),
//                                   child: item.title)
//                               : Container(),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }

// class NavigationItem {
//   final Icon icon;
//   final Text title;
//   final Color color;

//   NavigationItem(this.icon, this.title, this.color);
// }
