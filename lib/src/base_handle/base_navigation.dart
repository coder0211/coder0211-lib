import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseNavigation {
  BaseNavigation._();

  /// # [push] Push a route to the navigator
  /// * Param [context] The context to push the route to
  /// * Param [routeName] The routeName to push
  /// * Param [clearStack] Clear the stack before pushing the
  /// * Example:
  /// ```dart
  /// BaseNavigation.push(context, routeName: '/', clearStack: true);
  /// ```
  static void push(BuildContext context,
      {required String routeName, Object? arguments, bool clearStack = false}) {
    if (clearStack)
      Navigator.pushNamedAndRemoveUntil(context, '$routeName', (r) => false,
          arguments: arguments);
    else
      Navigator.pushNamed(context, '$routeName', arguments: arguments);
  }

  /// # [pop] Pop the current route from the navigator
  static void pop(context) {
    Navigator.pop(context);
  }

  /// # [getArgs] Get the arguments from the current route
  /// * [context] The context to get the arguments
  /// * Param [key] The key to get the arguments
  /// * Example:
  /// ```dart
  /// BaseNavigation.getArgs(context, key: 'id');
  /// ```
  static T getArgs<T>(BuildContext context, {required String key}) {
    return (ModalRoute.of(context)!.settings.arguments
        as Map<String, dynamic>)[key] as T;
  }
}
