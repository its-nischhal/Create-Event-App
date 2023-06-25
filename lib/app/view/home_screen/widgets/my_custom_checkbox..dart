import 'package:flutter/material.dart';
import '../../../utils/ui_functions.dart';

class MyCustomCheckbox extends StatelessWidget {
  const MyCustomCheckbox(
      {super.key, required this.checkboxValue, required this.text});
  final ValueNotifier<bool> checkboxValue;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getScreenWidth(percentage: 0.5),
      child: Row(
        children: [
          ValueListenableBuilder(
              valueListenable: checkboxValue,
              builder: (context, value, child) {
                return Checkbox(
                  value: checkboxValue.value,
                  onChanged: (value) => checkboxValue.value = value!,
                );
              }),
          GestureDetector(
            onTap: () => checkboxValue.value = !checkboxValue.value,
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
