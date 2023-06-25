import 'package:flutter/cupertino.dart';
import 'package:form_app/app/model/form/form_model.dart';

abstract class HomeEvent {}

class SubmitEvent extends HomeEvent {
  SubmitEvent({
    required this.fromModel,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;
  final FormModel fromModel;
}
