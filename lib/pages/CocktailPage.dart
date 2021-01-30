import 'package:cocktailo/constants.dart';
import 'package:cocktailo/models/Cocktail.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CocktailPage extends StatelessWidget {
  const CocktailPage({
    @required this.cocktail,
    @required this.onBack,
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;
  final Function onBack;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorDarkBlue,
      body: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
                child: ExtendedImage.network(
                  cocktail.image,
                  fit: BoxFit.fill,
                  cache: true,
                  border: Border.all(
                    color: Colors.red,
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  //cancelToken: cancellationToken,
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 5,
                  ),
                  child: NeumorphicButton(
                    onPressed: onBack,
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
              )
            ],
          ),
          Text(
            cocktail.name,
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
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...cocktail.ingredients
                      .map((e) => Flexible(
                            child: Column(
                              children: [
                                Flexible(
                                  child: Text(
                                    e.name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                      fontFamily: 'LEMONMILK',
                                      shadows: [
                                        BoxShadow(
                                          blurRadius: 5,
                                          color: Color(0xffED1E79),
                                          spreadRadius: 5,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    e.measure,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontFamily: 'Chivo',
                                      shadows: [
                                        BoxShadow(
                                          blurRadius: 5,
                                          color: Color(0xffED1E79),
                                          spreadRadius: 5,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList()
                ],
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Text(
                cocktail.instructions,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'LEMONMILK',
                  shadows: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Color(0xffED1E79),
                      spreadRadius: 5,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
