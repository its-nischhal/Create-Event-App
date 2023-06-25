import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_app/app/utils/extension/navigation_extentions.dart';

import '../../utils/ui_functions.dart';

void showDurationDialog(
    BuildContext context, TextEditingController controller) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      child: SizedBox(
        height: getScreenHeight(percentage: .5),
        width: getScreenWidth(percentage: .8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: CupertinoTimerPicker(
                  secondInterval: 2,
                  mode: CupertinoTimerPickerMode.hm,
                  onTimerDurationChanged: (value) {
                    controller.text =
                        '${value.inHours} Hours ${value.inMinutes % 60} Minutes';
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () => context.pop(), child: const Text('Done'))
            ],
          ),
        ),
      ),
    ),
  );
}
