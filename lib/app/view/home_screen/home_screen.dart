import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_app/app/controller/bloc/home/home_bloc.dart';
import 'package:form_app/app/controller/bloc/home/home_state.dart';
import 'package:form_app/app/model/form/form_model.dart';
import 'package:form_app/app/utils/constants/color_constants.dart';
import 'package:form_app/app/utils/constants/route_constants.dart';
import 'package:form_app/app/utils/extension/navigation_extentions.dart';
import 'package:form_app/app/view/home_screen/widgets/my_custom_checkbox..dart';
import 'package:form_app/app/view/home_screen/widgets/my_custom_formfield.dart';
import 'package:form_app/app/view/home_screen/widgets/submit_button.dart';

import '../../utils/ui_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _scrollController;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController guestEmailController = TextEditingController();
  final TextEditingController notificationController = TextEditingController();
  final TextEditingController reminderController = TextEditingController();
  ValueNotifier<bool> isButtonVisible = ValueNotifier(true);
  ValueNotifier<bool> seeGuestList = ValueNotifier(false);
  ValueNotifier<bool> modifyEvent = ValueNotifier(false);
  ValueNotifier<bool> inviteOthers = ValueNotifier(false);
  ValueNotifier<bool> isDescriptionVisible = ValueNotifier(false);
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent - 100 >=
          _scrollController.offset) {
        isButtonVisible.value = true;
      } else {
        isButtonVisible.value = false;
      }
      FocusManager.instance.primaryFocus?.unfocus();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    titleController.dispose();
    dateController.dispose();
    timeController.dispose();
    durationController.dispose();
    locationController.dispose();
    guestEmailController.dispose();
    reminderController.dispose();
    isButtonVisible.dispose();
    seeGuestList.dispose();
    modifyEvent.dispose();
    inviteOthers.dispose();
    isDescriptionVisible.dispose();
    super.dispose();
  }

  FormModel getFormData() {
    return FormModel(
        title: titleController.text,
        date: dateController.text,
        time: timeController.text,
        duration: durationController.text,
        location: locationController.text,
        guests: [guestEmailController.text],
        notification: notificationController.text,
        reminder: reminderController.text,
        guestCanModifyEvent: modifyEvent.value,
        guestCanInviteOthers: inviteOthers.value,
        guestCanSeeGuestList: seeGuestList.value);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
      if (state is HomeSuccessState) {
        context.pushNamed(Routes.developmentScreen);
      } else if (state is HomeUnSuccessState) {}
    }, builder: (context, state) {
      return Scaffold(
        body: SafeArea(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Stack(
              children: [
                ListView(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(10),
                  children: [
                    Text(
                      'Create Event',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Divider(
                      height: 40,
                      thickness: 1.5,
                      color: ColorConstants.lightGreyColor,
                    ),
                    MyCustomFormWidget(
                      mode: MyCustomFormWidgetMode.textfield,
                      errorText: 'Please enter a valid Input',
                      inputType: TextInputType.text,
                      heightPercentage: .3,
                      title: 'Title*',
                      hintText: 'Event Title',
                      controller: titleController,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: MyCustomFormWidget(
                            errorText: 'Please select a date',
                            mode: MyCustomFormWidgetMode.date,
                            heightPercentage: .3,
                            onSubmit: () {
                              if (dateController.text.isNotEmpty &&
                                  timeController.text.isNotEmpty) {
                                isDescriptionVisible.value = true;
                                // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                                isDescriptionVisible.notifyListeners();
                              }
                            },
                            title: 'Date*',
                            hintText: 'Set Date',
                            suffix: const Icon(Icons.calendar_today),
                            controller: dateController,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: MyCustomFormWidget(
                            errorText: 'Please select a time',
                            mode: MyCustomFormWidgetMode.time,
                            onSubmit: () {
                              if (dateController.text.isNotEmpty &&
                                  timeController.text.isNotEmpty) {
                                isDescriptionVisible.value = true;

                                // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                                isDescriptionVisible.notifyListeners();
                              }
                            },
                            heightPercentage: .3,
                            title: 'Time*',
                            hintText: 'Set Time',
                            suffix: const Icon(Icons.more_time),
                            controller: timeController,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                    MyCustomFormWidget(
                      errorText: 'Please select the duration of meeting',
                      mode: MyCustomFormWidgetMode.duration,
                      heightPercentage: .3,
                      title: 'Duration*',
                      hintText: 'Set Duration',
                      suffix: const Icon(Icons.swap_vert_outlined),
                      controller: durationController,
                    ),
                    ValueListenableBuilder(
                      valueListenable: isDescriptionVisible,
                      builder: (context, value, child) => Visibility(
                        visible: value,
                        child: Text(
                            'The meeting will schedule on ${dateController.text} from ${timeController.text}'),
                      ),
                    ),
                    MyCustomFormWidget(
                      mode: MyCustomFormWidgetMode.textfield,
                      errorText: 'Please enter a valid Location',
                      inputType: TextInputType.streetAddress,
                      heightPercentage: .3,
                      title: 'Location*',
                      hintText: 'Location',
                      suffix: Container(),
                      controller: locationController,
                    ),
                    MyCustomFormWidget(
                      mode: MyCustomFormWidgetMode.textfield,
                      errorText: 'Please add at least one guest',
                      inputType: TextInputType.emailAddress,
                      heightPercentage: .3,
                      title: 'Add guests*',
                      hintText: 'Guest Email',
                      validator: (value) {
                        var isValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value ?? '');
                        return isValid
                            ? null
                            : 'Please Enter a valid Email Address';
                      },
                      controller: guestEmailController,
                    ),
                    SizedBox(
                      height: getScreenWidth(percentage: .3),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Notification',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                CupertinoSegmentedControl<String>(
                                    pressedColor: Colors.grey,
                                    unselectedColor: Colors.white,
                                    children: {
                                      'email': Container(
                                          width: 80,
                                          height: 40,
                                          alignment: Alignment.center,
                                          child: const Text('Email')),
                                      'slack': Container(
                                          width: 80,
                                          height: 40,
                                          alignment: Alignment.center,
                                          child: const Text('Slack')),
                                    },
                                    onValueChanged: (value) {})
                              ],
                            ),
                          ),
                          Expanded(
                            child: MyCustomFormWidget(
                                mode: MyCustomFormWidgetMode.dropdown,
                                errorText: 'Set a reminder for the meeting',
                                title: 'Set Reminder',
                                suffix: const Icon(Icons.arrow_drop_down),
                                controller: reminderController,
                                hintText: '',
                                items: const ['1 hours', '24 hours'],
                                heightPercentage: .3),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Guests can',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    MyCustomCheckbox(
                        checkboxValue: modifyEvent, text: 'Modify Event'),
                    MyCustomCheckbox(
                        checkboxValue: inviteOthers, text: 'Invite Others'),
                    MyCustomCheckbox(
                        checkboxValue: seeGuestList, text: 'See Guest Lists'),
                    SizedBox(
                      height: 80,
                      child: SubmitButton(
                        formModel: getFormData(),
                        isInvert: true,
                        formKey: _formKey,
                        isButtonVisible: isButtonVisible,
                      ),
                    )
                  ],
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: SubmitButton(
                      formModel: getFormData(),
                      isInvert: false,
                      formKey: _formKey,
                      isButtonVisible: isButtonVisible,
                    ))
              ],
            ),
          ),
        ),
      );
    });
  }
}
