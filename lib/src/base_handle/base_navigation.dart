import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseNavigation {
  static push(BuildContext context,
      {required String routeName, Object? arguments, bool clearStack = false}) {
    if (clearStack)
      Navigator.pushNamedAndRemoveUntil(context, '$routeName', (r) => false,
          arguments: arguments);
    else
      Navigator.pushNamed(context, '$routeName', arguments: arguments);
  }

  static pop(context) {
    Navigator.pop(context);
  }
}
