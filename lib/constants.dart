import 'package:flutter/material.dart';

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
