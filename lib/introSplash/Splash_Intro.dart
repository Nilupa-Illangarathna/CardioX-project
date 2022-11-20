import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
// import '../Future Needs/home.dart';
import 'package:lottie/lottie.dart';
import '../pages/HomePage.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {
  AnimationController _lottieAnimation;
  var expanded = false;
  double _bigFontSize = kIsWeb ? 234 : 178;
  final transitionDuration = Duration(seconds: 1);

  @override
  void initState() {
    _lottieAnimation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    Future.delayed(Duration(seconds: 1))
        .then((value) => setState(() => expanded = true))
        .then((value) => Duration(seconds: 1))
        .then(
          (value) => Future.delayed(Duration(seconds: 1)).then(
            (value) => _lottieAnimation.forward().then(
                  (value) => Navigator.of(context)
                      .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (route) => false),
                ),
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
              duration: transitionDuration,
              curve: Curves.fastOutSlowIn,
              style: TextStyle(
                color: Colors.black,
                fontSize: !expanded ? _bigFontSize*1.2 : 55,
                fontFamily: 'Times_New_Roman',
                fontWeight: FontWeight.w600,
              ),
              child: Text(
                "C",
              ),
            ),
            AnimatedCrossFade(
              firstCurve: Curves.fastOutSlowIn,
              crossFadeState: !expanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: transitionDuration,
              firstChild: Container(),
              secondChild: _logoRemainder(),
              alignment: Alignment.centerLeft,
              sizeCurve: Curves.easeInOut,
            ),
          ],
        ),
      ),
    );
  }

  Widget _logoRemainder() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "ARDIO",
          style: TextStyle(
            color: Colors.black.withOpacity(0.9),
            fontSize: 40,
            fontFamily: 'Times_New_Roman',
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "X",
          style: TextStyle(
            color: Colors.black.withOpacity(0.9),
            fontSize: 55,
            fontFamily: 'Times_New_Roman',
            fontWeight: FontWeight.w600,
          ),
        ),
        LottieBuilder.asset(
          'assets/CardioX_Splash_Animation.json',
          onLoaded: (composition) {
            _lottieAnimation..duration = composition.duration;
          },
          frameRate: FrameRate.max,
          repeat: false,
          animate: false,
          height: 300,
          width: 110,
          controller: _lottieAnimation,
        )
      ],
    );
  }

}
