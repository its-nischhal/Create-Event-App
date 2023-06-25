class FormModel {
  final String title;
  final String date;
  final String time;
  final String duration;
  final String location;
  final List<String> guests;
  final String notification;
  final String reminder;
  final bool guestCanModifyEvent;
  final bool guestCanInviteOthers;
  final bool guestCanSeeGuestList;

  FormModel({
    required this.title,
    required this.date,
    required this.time,
    required this.duration,
    required this.location,
    required this.guests,
    required this.notification,
    required this.reminder,
    required this.guestCanModifyEvent,
    required this.guestCanInviteOthers,
    required this.guestCanSeeGuestList,
  });

  FormModel copyWith({
    String? title,
    String? date,
    String? time,
    String? duration,
    String? location,
    List<String>? guests,
    String? notification,
    String? reminder,
    bool? guestCanModifyEvent,
    bool? guestCanInviteOthers,
    bool? guestCanSeeGuestList,
  }) =>
      FormModel(
        title: title ?? this.title,
        date: date ?? this.date,
        time: time ?? this.time,
        duration: duration ?? this.duration,
        location: location ?? this.location,
        guests: guests ?? this.guests,
        notification: notification ?? this.notification,
        reminder: reminder ?? this.reminder,
        guestCanModifyEvent: guestCanModifyEvent ?? this.guestCanModifyEvent,
        guestCanInviteOthers: guestCanInviteOthers ?? this.guestCanInviteOthers,
        guestCanSeeGuestList: guestCanSeeGuestList ?? this.guestCanSeeGuestList,
      );
}
