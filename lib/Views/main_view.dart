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
        leading: IconButton(
          icon: Switch(
            value: ColorCheck.isWhite,
            onChanged: (val){

            },
          ), onPressed: () {  },
        ),
      ),
    );
  }
}

class ColorCheck {
  static bool isWhite = false;
}
