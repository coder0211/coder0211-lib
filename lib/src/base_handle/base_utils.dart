import 'package:coder0211/src/base_widget/base_text.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants.dart';

class BaseUtils {
  BaseUtils._();

  /// # [showToast] Show toast message
  /// * param[message] Message to show
  /// * param[toastLength] Length of toast
  /// * param[bgColor] Background color of toast
  static void showToast(String? message,
      {Toast? toastLength, required Color? bgColor}) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: message ?? '',
        textColor: Colors.white,
        backgroundColor: bgColor,
        gravity: ToastGravity.BOTTOM,
        toastLength: toastLength ?? Toast.LENGTH_SHORT);
  }

  /// # [showScaffoldMessenger] Show scaffold messenger
  /// * param[text] Text to show
  /// * param[textSytle] Text style
  /// * param[bgColor] Background color of scaffold
  static void showScaffoldMessenger(BuildContext context,
      {required String text,
      required TextStyle? textStyle,
      required Color? bgColor}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(milliseconds: 300),
      backgroundColor: bgColor,
      content: BaseText(
        text,
        style: textStyle,
      ),
    ));
  }

  /// # [copy] Copy text to clipboard
  /// * param[content] Text to copy
  /// * param[bgColor] Background color of showToast
  static void copy(BuildContext context,
      {required String content, required Color? bgColor}) {
    Clipboard.setData(new ClipboardData(text: content)).then((_) {
      showToast('Copied', bgColor: bgColor);
    });
  }

  /// # [getScreenWidth] Get screen width
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// # [getScreenHeight] Get screen height
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// # [hideKeyBoard] Hide keyboard
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  /// # [onWidgetBuildDone] When widget build done
  static void onWidgetBuildDone(Function function) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      function();
    });
  }

  /// # [checkValidateEmail] Check validate email
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

  /// # [splitYoutubeId] Split youtube id
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

  /// # [checkConnection] Check connection
  static Future<bool> checkConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  /// # [reversedNumber] Reversed number
  static int reversedNumber({required int number}) =>
      int.parse(number.toString().split('').reversed.join(''));
}
