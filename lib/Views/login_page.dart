import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_chat_app/Constants/color_constant.dart';
import 'package:i_chat_app/Constants/images.dart';
import 'package:i_chat_app/Constants/text_constants.dart';
import 'package:i_chat_app/Providers/auth_provider.dart';
import 'package:i_chat_app/ReusableWidgets/reusable_widgets.dart';
import 'package:i_chat_app/Utils/toast.dart';
import 'package:i_chat_app/Views/main_view.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    AuthEmailProvider authProvider = Provider.of<AuthEmailProvider>(context);
    switch (authProvider.status) {
      case Status.authenticateError:
        ToastMessage("Login failed").errorMessage();
        break;
      case Status.authenticateCancel:
        ToastMessage("Login canceled").errorMessage();
        break;
      case Status.authenticated:
        ToastMessage("Login success").successMessage();
        break;
      default:
        break;
    }
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              ColorConstants.themeColor,
              ColorConstants.themeColor1,
              ColorConstants.primaryColor
            ], begin: Alignment.bottomRight, end: Alignment.topLeft),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(ImagesPath.loginLogo, height: 300.h, width: 300.w),
              InkWell(
                onTap: () async {
                  bool isSuccess = await authProvider.signIn();
                  if (isSuccess) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainScreen()),
                        (route) => false);
                  }
                },
                child: Container(
                  height: 70.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                      color: ColorConstants.whiteColor,
                      border: Border.all(color: ColorConstants.whiteColor),
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(ImagesPath.googleLogo, height: 40.h),
                      Text(
                        "Google",
                        style: textTheme.titleMedium,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                  child: authProvider.status == Status.authenticating
                      ? loading(ColorConstants.whiteColor)
                      : const SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }
}
