import 'package:flutter/material.dart';
import 'package:i_chat_app/Constants/color_constant.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCheck.isWhite
          ? ColorConstants.whiteColor
          : ColorConstants.blackColor,
      appBar: AppBar(
        backgroundColor: ColorCheck.isWhite
            ? ColorConstants.whiteColor
            : ColorConstants.blackColor,
        leading: Switch(
          value: ColorCheck.isWhite,
          onChanged: (val) {
            setState(() {
              ColorCheck.isWhite = val;
            });
          },
        ),
      ),
    );
  }
}

class ColorCheck {
  static bool isWhite = true;
}
