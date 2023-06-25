import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:form_app/app/utils/ui_functions.dart';
import 'package:form_app/app/view/widgets/custom_dialog.dart';

class MyCustomFormWidget extends StatelessWidget {
  const MyCustomFormWidget({
    super.key,
    required this.title,
    this.suffix,
    required this.controller,
    required this.hintText,
    required this.heightPercentage,
    this.validator,
    required this.mode,
    this.items,
    this.inputType,
    required this.errorText,
    this.onSubmit,
  });
  final MyCustomFormWidgetMode mode;
  final String title, hintText, errorText;
  final Widget? suffix;
  final TextEditingController controller;
  final double heightPercentage;
  final String? Function(String? value)? validator;
  final TextInputType? inputType;
  final List<String>? items;
  final void Function()? onSubmit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getScreenWidth(percentage: heightPercentage),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          if (mode == MyCustomFormWidgetMode.textfield)
            TextFormField(
              autovalidateMode: AutovalidateMode.disabled,
              validator: (val) {
                if (val!.isEmpty) return errorText;

                if (validator != null) return validator!(val);
                return null;
              },
              controller: controller,
              keyboardType: inputType,
              decoration: InputDecoration(
                hintText: hintText,
                suffix: suffix,
              ),
            ),
          if (mode == MyCustomFormWidgetMode.dropdown)
            DropdownSearch<String>(
              items: items!,
              validator: (val) {
                if (val == '') return errorText;

                if (validator != null) validator!(val);
                return null;
              },
              onChanged: (value) => controller.text = value!,
              popupProps: PopupProps.menu(
                  constraints:
                      BoxConstraints.tight(const Size.fromHeight(150))),
              dropdownButtonProps: DropdownButtonProps(
                icon: suffix!,
                alignment: Alignment.center,
              ),
              dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                hintText: hintText,
              )),
            ),
          if (mode != MyCustomFormWidgetMode.textfield &&
              mode != MyCustomFormWidgetMode.dropdown)
            InkWell(
              onTap: () async {
                if (mode == MyCustomFormWidgetMode.date) {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 30)),
                  ).then((value) {
                    if (value != null) {
                      controller.text = '${value.day}/${value.month}';
                      onSubmit!();
                    }
                  });
                } else if (mode == MyCustomFormWidgetMode.time) {
                  showTimePicker(context: context, initialTime: TimeOfDay.now())
                      .then((value) {
                    if (value != null) {
                      controller.text =
                          '${value.hourOfPeriod}:${value.minute} ${value.period.name}';
                      onSubmit!();
                    }
                  });
                } else if (mode == MyCustomFormWidgetMode.duration) {
                  showDurationDialog(context, controller);
                }
              },
              child: TextFormField(
                enabled: false,
                validator: (val) {
                  if (val!.isEmpty) return errorText;

                  if (validator != null) validator!(val);
                  return null;
                },
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  suffix: suffix,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

enum MyCustomFormWidgetMode {
  textfield,
  dropdown,
  date,
  time,
  duration,
  segmentedSlider
}
