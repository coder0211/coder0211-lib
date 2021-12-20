import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../constants.dart';

class BaseUtils {
  BaseUtils._();

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static void onWidgetBuildDone(Function function) {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      function();
    });
  }

  static bool checkValidateEmail(BuildContext context, String input) {
    final RegExp regExp = RegExp(Constants.REGEX_EMAIL);
    if (input.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(input)) {
      return false;
    } else {
      return true;
    }
  }

  static String? splitYoutubeId(String url, {bool trimWhitespaces = true}) {
    if (!url.contains(Constants.KEY_HTTP) &&
        (url.length == Constants.ID_LENGTH)) return url;
    if (trimWhitespaces) url = url.trim();
    for (final regex in Constants.REGEX_URL_YOUTUBE) {
      final Match? match = RegExp(regex).firstMatch(url);
      if (match != null && match.groupCount >= 1) return match.group(1);
    }
    return null;
  }

  static Future<bool> checkConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  static int reversedNumber({required int number}) =>
      int.parse(number.toString().split('').reversed.join(''));
}
