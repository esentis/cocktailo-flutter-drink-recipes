import 'package:cocktailo/connection/api_connection.dart';
import 'package:cocktailo/constants.dart';
import 'package:cocktailo/pages/mobile/landing_page_mobile.dart';
import 'package:cocktailo/pages/desktop/landing_page_desktop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:splashscreen/splashscreen.dart';

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
  Future<Widget> loadFromFuture() async {
    // var popularDrinks = await getPopularDrinks();
    // await Future.delayed(const Duration(seconds: 1));
    return Future.value(
      ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
            return LandingPageMobile(
              apiResponse: 'popularDrinks',
            );
          }
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            return Container(
              child: LandingPageDesktop(),
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
        style: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontFamily: 'LEMONMILK',
          shadows: [
            BoxShadow(
              blurRadius: 5,
              color: kColorPink,
              spreadRadius: 5,
            )
          ],
        ),
      ),
      backgroundColor: kColorDarkBlue,
      imageBackground: Image.asset('assets/loading_bg.png').image,
      loaderColor: kColorPink,
    );
  }
}
