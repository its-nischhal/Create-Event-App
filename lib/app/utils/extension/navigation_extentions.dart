import 'package:flutter/material.dart';

extension PushContext on BuildContext {
  pushNamed(String routeName, {Object? args}) {
    Navigator.of(this).pushNamed(routeName, arguments: args);
  }
}

extension PushAndRemoveUntilContext on BuildContext {
  pushNamedAndRemoveUntil(String routeName, {Object? args}) {
    Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, (route) => false, arguments: args);
  }
}

extension PushReplacementContext on BuildContext {
  pushReplacementNamed(String routeName, {Object? args}) {
    Navigator.of(this).pushReplacementNamed(routeName, arguments: args);
  }
}

extension PopContext on BuildContext {
  pop({Object? args}) {
    Navigator.of(this).pop(args);
  }
}
