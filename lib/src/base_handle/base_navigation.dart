import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseNavigation {
  BaseNavigation._();

  ///#[push] Push a route to the navigator
  ///param[routeName] The routeName to push
  ///param[context] The context to push the route to
  ///param[clearStack] Clear the stack before pushing the route (default: false)
  static push(BuildContext context,
      {required String routeName, Object? arguments, bool clearStack = false}) {
    if (clearStack)
      Navigator.pushNamedAndRemoveUntil(context, '$routeName', (r) => false,
          arguments: arguments);
    else
      Navigator.pushNamed(context, '$routeName', arguments: arguments);
  }

  ///#[pop] Pop the current route from the navigator
  static pop(context) {
    Navigator.pop(context);
  }

  ///[getArgs] Get the arguments from the current route
  ///[context] The context to get the arguments
  ///param[key] The key to get the arguments
  static T getArgs<T>(BuildContext context, {required String key}) {
    return (ModalRoute.of(context)!.settings.arguments
        as Map<String, dynamic>)[key] as T;
  }
}
