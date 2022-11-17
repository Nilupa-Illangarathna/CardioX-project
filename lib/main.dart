import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spash_app/pages/HomePage.dart';
import 'package:lottie/lottie.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([
    SystemUiOverlay.bottom, //This line is used for showing the bottom bar
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Hero(
          tag: "Splash",
          child:
          // Lottie.asset(
          //   'assets/videos/splash screen.lottie.json',
          //   fit: BoxFit.fitWidth,
          // ),
          Image.asset(
            'assets/images/CardioXPNG.jpg',
          ),
        ),
        nextScreen: HomePage(),
        duration: 2000,
        splashTransition: SplashTransition.fadeTransition,
        // disableNavigation: true,
        splashIconSize: 400,
        backgroundColor: Colors.white.withOpacity(1),
      ),

    );

  }
}




