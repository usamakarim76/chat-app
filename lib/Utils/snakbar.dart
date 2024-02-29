import 'package:flutter/material.dart';
import 'package:i_chat_app/Constants/text_constants.dart';

class ShowMessageSnackBar {
  final BuildContext context;
  final String data;

  ShowMessageSnackBar(this.data, this.context);
  void successMessage() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(data, style: textTheme.titleSmall),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 1),
    ));
  }

  void errorMessage() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(data, style: textTheme.titleSmall),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 1),
      // animation: ,
    ));
  }
}
