import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rgb_trim/widgets/notify/custom_alertbox.dart';

class NotifyUser {
  void success(context, message) {
    try {
      Timer timer = Timer(Duration(milliseconds: 3000), () {
        Navigator.of(context, rootNavigator: true).pop();
      });
      showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return CustomAlertDialog(message, true);
        },
      ).then((value) {
        // dispose the timer in case something else has triggered the dismiss.
        timer?.cancel();
        timer = null;
      });
    } catch (e) {}
  }

  void error(context, message) {
    try {
      Timer timer = Timer(Duration(milliseconds: 3000), () {
        Navigator.of(context, rootNavigator: true).pop();
      });
      showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return CustomAlertDialog(message, false);
        },
      ).then((value) {
        // dispose the timer in case something else has triggered the dismiss.
        timer?.cancel();
        timer = null;
      });
    } catch (e) {}
  }
}
