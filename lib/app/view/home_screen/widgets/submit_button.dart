import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_app/app/controller/bloc/home/home_bloc.dart';
import 'package:form_app/app/controller/bloc/home/home_event.dart';
import 'package:form_app/app/model/form/form_model.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton(
      {super.key,
      required this.isButtonVisible,
      required this.formKey,
      required this.isInvert,
      required this.formModel});
  final ValueNotifier<bool> isButtonVisible;
  final GlobalKey<FormState> formKey;
  final bool isInvert;
  final FormModel formModel;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isButtonVisible,
      builder: (context, value, child) => Visibility(
          visible: isInvert ? !value : value,
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                child: const Text('Create Event'),
                onPressed: () {
                  context
                      .read<HomeBloc>()
                      .add(SubmitEvent(fromModel: formModel, formKey: formKey));
                },
              ))),
    );
  }
}
