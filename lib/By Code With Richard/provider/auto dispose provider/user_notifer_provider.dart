import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

// final userNotiferprovider = NotifierProvider<UserNotifer, String>(
final userNotiferprovider = AutoDisposeNotifierProvider<UserNotifer, String>(
  UserNotifer.new,
);

// class UserNotifer extends Notifier<String> {
class UserNotifer extends AutoDisposeNotifier<String> {
  //when we add autodispose then it will auto dispos after no longer use of that notifer and will not cache data anymore,
  //if nobody is watching it then it will auto dispose itself.
  @override
  String build() {
    //if you want to auto dispose with timer.
    final keepAlive = ref.keepAlive();
    Timer? timer;
    ref.onDispose(() {
      timer?.cancel();
    });
    ref.onCancel(() {
      timer = Timer(Duration(seconds: 10), () {
        keepAlive.close();
      });
    });
    ref.onResume(() {
      timer?.cancel();
    });
    //till here for timer

    return "No User Found";
  }

  void update(String value) {
    state = value;
  }
}
