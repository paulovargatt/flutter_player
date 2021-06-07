import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionSheetVideo extends StatelessWidget {
  final video;
  const ActionSheetVideo({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.more_vert),
      onPressed: () {
        showAdaptiveActionSheet(
          context: context,
          actions: <BottomSheetAction>[
            BottomSheetAction(
              title:  Text(
                '${video.title}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {},
              leading: const Icon(Icons.add, size: 25),
            ),
            BottomSheetAction(
              title: const Text(
                'Delete',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
              ),
              onPressed: () {},
              leading: const Icon(
                Icons.delete,
                size: 25,
                color: Colors.red,
              ),
            ),
          ],
          cancelAction: CancelAction(title: const Text('Cancel')),
        );
      },
    );
  }
}
