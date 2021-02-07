import 'package:cocktailo/connection/api_connection.dart';
import 'package:cocktailo/constants.dart';
import 'package:cocktailo/models/cocktail.dart';
import 'package:cocktailo/pages/mobile/landing_page_mobile.dart';
import 'package:cocktailo/pages/desktop/landing_page_desktop.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:splashscreen/splashscreen.dart';

import 'package:logger/logger.dart';

var logger = Logger();

void main() async {
  await DotEnv().load('.env');

  runApp(
    ProviderScope(
      child: GetMaterialApp(home: MyApp()),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Cocktail> cocktails = [];
  Future<Widget> loadFromFuture() async {
    var popularDrinks = await getPopularDrinks();
    logger.wtf(popularDrinks.length);
    if (popularDrinks != DioErrorType) {
      cocktails = popularDrinks;
    }
    await Future.delayed(const Duration(seconds: 1));
    return Future.value(
      ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
            return LandingPageMobile(
              cocktailsResponse: cocktails,
            );
          }
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            return Container(
              child: LandingPageDesktop(
                cocktails: cocktails,
              ),
            );
          }
          return const Text('oops');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      navigateAfterFuture: loadFromFuture(),
      loadingText: Text(
        'Preparing cocktails...',
        style: kBasicStyle.copyWith(
          fontSize: 13,
        ),
      ),
      backgroundColor: kColorDarkBlue,
      imageBackground: Image.asset(
        'assets/loading_bg.png',
        height: 150,
      ).image,
      loaderColor: kColorPink,
    );
  }
}
