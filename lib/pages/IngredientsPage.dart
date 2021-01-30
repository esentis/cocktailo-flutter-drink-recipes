import 'package:cocktailo/connection/api_connection.dart';
import 'package:cocktailo/constants.dart';
import 'package:cocktailo/pages/ResultsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class IngredientsPage extends StatefulWidget {
  @override
  _IngredientsPageState createState() => _IngredientsPageState();
}

class _IngredientsPageState extends State<IngredientsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorDarkBlue,
      appBar: AppBar(
        backgroundColor: kColorDarkBlue,
        title: Center(
          child: Text(
            'Search cocktails based on ingredient',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
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
        ),
        leading: NeumorphicButton(
          onPressed: Get.back,
          style: NeumorphicStyle(
            color: kColorDarkBlue,
            shadowDarkColor: kColorDarkBlue.withOpacity(0.9),
            shadowDarkColorEmboss: kColorPink,
            shadowLightColorEmboss: kColorPink,
            shadowLightColor: kColorDarkBlue.withOpacity(0.9),
            shape: NeumorphicShape.convex,
            boxShape: const NeumorphicBoxShape.circle(),
          ),
          padding: const EdgeInsets.all(5),
          child: Icon(
            Foundation.arrow_left,
            size: 35,
            color: kColorPink,
          ),
        ),
      ),
      body: FutureBuilder(
        future: getIngredients(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: kColorPink.withOpacity(0.5),
              valueColor: AlwaysStoppedAnimation<Color>(kColorPink),
              strokeWidth: 14,
            ));
          }

          logger.wtf(snapshot.data['drinks'].length);
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data['drinks'].length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                  vertical: 12,
                ),
                child: NeumorphicButton(
                  onPressed: () async {
                    await Get.to(
                      ResultsPage(
                        ingredient: snapshot.data['drinks'][index]
                            ['strIngredient1'],
                      ),
                    );
                  },
                  style: NeumorphicStyle(
                    color: kColorDarkBlue,
                    shadowDarkColor: kColorPink,
                    shadowDarkColorEmboss: kColorPink,
                    shadowLightColorEmboss: kColorPink,
                    shadowLightColor: Colors.transparent,
                    shape: NeumorphicShape.convex,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      snapshot.data['drinks'][index]['strIngredient1'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
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
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
