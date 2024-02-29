import 'package:flutter/cupertino.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget loading(Color color) {
  return LoadingAnimationWidget.newtonCradle(color: color, size: 80);
}
