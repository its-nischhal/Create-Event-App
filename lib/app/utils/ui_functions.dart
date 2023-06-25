import 'package:flutter/cupertino.dart';

late final Size _deviceSize;
void setDeviceSize(Size size) {
  _deviceSize = size;
}

double getScreenWidth({required double percentage}) {
  return _deviceSize.width * percentage;
}

double getScreenHeight({required double percentage}) {
  return _deviceSize.height * percentage;
}
