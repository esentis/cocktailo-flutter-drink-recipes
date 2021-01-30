import 'package:cocktailo/connection/api_connection.dart';
import 'package:cocktailo/constants.dart';
import 'package:cocktailo/pages/LandingPage.dart';
import 'package:cocktailo/provider/chosen_cocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
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
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChosenCocktail())],
      child: NeumorphicApp(
        home: SplashScreen(
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
        ),
      ),
    );
  }
}
