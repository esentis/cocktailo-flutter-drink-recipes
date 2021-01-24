import 'package:cocktailo/connection/api_connection.dart';
import 'package:cocktailo/pages/LandingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';

void main() async {
  await DotEnv().load('.env');

  runApp(
    GetMaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Widget> loadFromFuture() async {
    var popularDrinks = await getPopularDrinks();

    return Future.value(LandingPage(
      apiResponse: popularDrinks,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      navigateAfterFuture: loadFromFuture(),
      backgroundColor: const Color(0xffe3f6f5),
      imageBackground: Image.asset('assets/loading_bg.png').image,
      loaderColor: const Color(0xffED1E79),
    );
  }
}
