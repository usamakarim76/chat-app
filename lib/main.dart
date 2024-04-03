import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:i_chat_app/Constants/color_constant.dart';
import 'package:i_chat_app/Providers/auth_provider.dart';
import 'package:i_chat_app/Views/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  const MyApp({super.key, required this.prefs});
  // @override
  // Widget build(BuildContext context) {
  //   return MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider<AuthEmailProvider>(
  //         create: (_) => AuthEmailProvider(
  //             firebaseFirestore: FirebaseFirestore.instance,
  //             googleSignIn: GoogleSignIn(),
  //             firebaseAuth: FirebaseAuth.instance,
  //             prefs: prefs),
  //       ),
  //     ],
  //     child: MaterialApp(
  //       title: AppConstants.appTitle,
  //       theme: ThemeData(primaryColor: Colors.white),
  //       home: const SplashView(),
  //       debugShowCheckedModeBanner: false,
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthEmailProvider>(
              create: (_) => AuthEmailProvider(
                  firebaseFireStore: FirebaseFirestore.instance,
                  googleSignIn: GoogleSignIn(),
                  firebaseAuth: FirebaseAuth.instance,
                  prefs: prefs),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            theme: ThemeData(primaryColor: ColorConstants.whiteColor),
            home: child,
          ),
        );
      },
      child: const SplashView(),
    );
  }
}
