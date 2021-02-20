import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

/// The basic logger of the app.
var kLogger = Logger();

/// ### Pink color of the app
/// ```dart
/// Color(0xffED1E79)
/// ```
Color kColorPink = const Color(0xffED1E79);

/// ### Dark blue color of the app
/// ```dart
/// Color(0xff0f1123)
/// ```
Color kColorDarkBlue = const Color(0xff0f1123);

/// ### Default textStyle of the app.
/// ```dart
/// color: Colors.white
/// fontSize: 25
/// fontFamily: 'LEMONMILK'
/// ```
TextStyle kBasicStyle = TextStyle(
  color: Colors.white,
  fontSize: 25,
  fontFamily: 'LEMONMILK',
  shadows: [
    BoxShadow(
      blurRadius: 5,
      color: kColorPink,
      spreadRadius: 5,
    )
  ],
);

/// ### Secondary textStyle of the app.
/// ```dart
/// color: Colors.white
/// fontSize: 25
/// fontFamily: 'Chivo'
/// ```
TextStyle kSecondaryStyle = TextStyle(
  color: Colors.white,
  fontSize: 25,
  fontFamily: 'Chivo',
  shadows: [
    BoxShadow(
      blurRadius: 5,
      color: kColorPink,
      spreadRadius: 5,
    )
  ],
);

/// ### Secondary textStyle of the app.
/// ```dart
/// color: Colors.white
/// fontSize: 25
/// fontFamily: 'CookiesLover-Empty'
/// ```
TextStyle kBubbleTextEmpty = TextStyle(
  color: Colors.white,
  fontSize: 25,
  fontFamily: 'CookiesLoverEmpty',
  shadows: [
    BoxShadow(
      blurRadius: 5,
      color: kColorPink,
      spreadRadius: 5,
    )
  ],
);

/// ### Secondary textStyle of the app.
/// ```dart
/// color: Colors.white
/// fontSize: 25
/// fontFamily: 'CookiesLover-Empty'
/// ```
TextStyle kBubbleTextFilled = TextStyle(
  color: Colors.white,
  fontSize: 25,
  fontFamily: 'CookiesLoverFilled',
  shadows: [
    BoxShadow(
      blurRadius: 5,
      color: kColorPink,
      spreadRadius: 5,
    )
  ],
);

/// Grid items animation options.
final animatedOptions = const LiveOptions(
  // Start animation after (default zero)
  //delay: Duration(milliseconds: 0),

  // Show each item through (default 250)
  showItemInterval: Duration(milliseconds: 50),

  // Animation duration (default 250)
  showItemDuration: Duration(milliseconds: 200),

  // Animations starts at 0.05 visible
  // item fraction in sight (default 0.025)
  visibleFraction: 0.05,

  // Repeat the animation of the appearance
  // when scrolling in the opposite direction (default false)
  // To get the effect as in a showcase for ListView, set true
  reAnimateOnVisibility: true,
);
