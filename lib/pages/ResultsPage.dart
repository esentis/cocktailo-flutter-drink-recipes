import 'package:cocktailo/connection/api_connection.dart';
import 'package:cocktailo/constants.dart';
import 'package:cocktailo/models/Cocktail.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

var logger = Logger();

// TODO: FIX THE LIST
class ResultsPage extends StatefulWidget {
  final String ingredient;
  const ResultsPage({
    this.ingredient,
  });
  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  List<Cocktail> cocktails = [];
  void mapCocktails(List<dynamic> drinks) {
    drinks.forEach((element) {
      var cocktail = Cocktail();
      cocktail.fromMap(element);
      cocktails.add(cocktail);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorDarkBlue,
      appBar: AppBar(
        backgroundColor: kColorDarkBlue,
        title: Center(
          child: Text(
            'Search results',
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
        future: searchDrinkByIngredient(widget.ingredient),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: kColorPink.withOpacity(0.5),
                valueColor: AlwaysStoppedAnimation<Color>(kColorPink),
                strokeWidth: 14,
              ),
            );
          }

          logger.wtf(snapshot.data);
          mapCocktails(snapshot.data['drinks']);
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [
                ...cocktails.map((drink) {
                  return NeumorphicButton(
                    style: NeumorphicStyle(
                      color: kColorDarkBlue,
                      shadowDarkColor: kColorPink,
                      shadowDarkColorEmboss: kColorPink,
                      shadowLightColorEmboss: kColorPink,
                      shadowLightColor: Colors.transparent,
                      shape: NeumorphicShape.convex,
                    ),
                    child: ListTile(
                      leading: ExtendedImage.network(drink.image),
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(drink.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'LEMONMILK',
                              shadows: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: kColorPink,
                                  spreadRadius: 5,
                                )
                              ],
                            )),
                      ),
                    ),
                  );
                })
              ],
              physics: const BouncingScrollPhysics(),
            ),
          );
        },
      ),
    );
  }
}
