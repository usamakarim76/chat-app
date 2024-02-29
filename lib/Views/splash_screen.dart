// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:i_chat_app/Constants/color_constant.dart';
import 'package:i_chat_app/Constants/images.dart';
import 'package:i_chat_app/Providers/auth_provider.dart';
import 'package:i_chat_app/ReusableWidgets/reusable_widgets.dart';
import 'package:i_chat_app/Views/login_page.dart';
import 'package:i_chat_app/Views/main_view.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        checkLoginStatus();
      },
    );
  }

  void checkLoginStatus() async {
    AuthEmailProvider authEmailProvider = context.read<AuthEmailProvider>();
    bool isLoggedIn = await authEmailProvider.isLoggedIn();
    if (isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MainScreen()));
      return;
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(ImagesPath.splashLogo),
          loading(ColorConstants.themeColor),
        ],
      ),
    );
  }
}
