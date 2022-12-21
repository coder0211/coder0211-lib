import 'package:coder0211/src/base_widget/base_text.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants.dart';

class BaseUtils {
  BaseUtils._();

  /// # [showToast] Show toast message with [message]
  /// * Param [message] Message to show
  /// * Param [toastLength] Length of toast
  /// * Param [bgColor] Background color of toast
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

  /// # [showScaffoldMessenger] Show scaffold messenger with message
  /// * Param [text] Text to show
  /// * Param [textSytle] Text style
  /// * Param [bgColor] Background color of scaffold
  static void showScaffoldMessenger(BuildContext context,
      {required String text,
      required TextStyle? textStyle,
      required Color? bgColor}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 300),
      backgroundColor: bgColor,
      content: BaseText(
        text,
        style: textStyle,
      ),
    ));
  }

  /// # [copy] Copy text to clipboard and show toast
  /// * Param [content] Text to copy
  /// * Param [bgColor] Background color of showToast
  static void copy(BuildContext context,
      {required String content,
      required Color? bgColor,
      required String text}) {
    Clipboard.setData(new ClipboardData(text: content)).then((_) {
      showToast(text, bgColor: bgColor);
    });
  }

  /// # [getScreenWidth] Get screen width in pixel
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// # [getScreenHeight] Get screen height (without status bar)
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// # [hideKeyBoard] Hide keyboard when tap outside
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  /// # [onWidgetBuildDone] When widget build done callback function
  static void onWidgetBuildDone(dynamic function, BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await function(context);
    });
  }

  /// # [checkValidateEmail] Check validate email address
  static bool checkValidateEmail(BuildContext context, String input) {
    final RegExp regExp = RegExp(Constants.regexEmail);
    if (input.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(input)) {
      return false;
    } else {
      return true;
    }
  }

  /// # [splitYoutubeId] Split youtube id from url youtube
  static String? splitYoutubeId(String url, {bool trimWhitespaces = true}) {
    if (!url.contains(Constants.keyHttp) && (url.length == Constants.idLength))
      return url;
    if (trimWhitespaces) url = url.trim();
    for (final regex in Constants.regexUrlYoutube) {
      final Match? match = RegExp(regex).firstMatch(url);
      if (match != null && match.groupCount >= 1) return match.group(1);
    }
    return null;
  }

  /// # [checkConnection] Check connection internet
  /// * Return true if connection internet
  /// * Return false if not connection internet
  static Future<bool> checkConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  /// # [reversedNumber] Reversed number
  static int reversedNumber({required int number}) =>
      int.parse(number.toString().split('').reversed.join(''));
}
