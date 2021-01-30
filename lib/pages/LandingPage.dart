import 'package:animations/animations.dart';
import 'package:cocktailo/constants.dart';
import 'package:cocktailo/models/Cocktail.dart';
import 'package:cocktailo/pages/CocktailPage.dart';
import 'package:cocktailo/provider/chosen_cocktail.dart';
import 'package:cocktailo/widgets/Dillema.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:cocktailo/widgets/Menu.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  final dynamic apiResponse;
  const LandingPage({
    this.apiResponse,
  });

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<Cocktail> cocktails = [];
  List<Cocktail> cocktailsFirstHalf = [];
  List<Cocktail> cocktailsSecondHalf = [];
  @override
  void initState() {
    super.initState();
    mapCocktails(widget.apiResponse['drinks']);
  }

  void mapCocktails(List<dynamic> apiResponse) {
    apiResponse.forEach((element) {
      var cocktail = Cocktail();
      cocktail.fromMap(element);
      cocktails.add(cocktail);
    });
    logger.wtf('All popular cocktails are ${cocktails.length}');
    cocktailsFirstHalf = cocktails.sublist(0, (cocktails.length / 2).floor());
    cocktailsSecondHalf =
        cocktails.sublist((cocktails.length / 2).floor(), cocktails.length);
    logger.wtf(cocktailsFirstHalf.toString());
    logger.wtf(cocktailsSecondHalf.toString());
    logger.wtf('${cocktailsFirstHalf.length} ${cocktailsSecondHalf.length}');
  }

  @override
  Widget build(BuildContext context) {
    var chosenCocktailState = context.watch<ChosenCocktail>();
    // We set a default cocktail for the state, it doesn't really matter it's just for the init.
    chosenCocktailState.chosenCocktail = cocktailsFirstHalf[0];
    return Scaffold(
      backgroundColor: kColorDarkBlue,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                child: Image.asset(
                  'assets/logo.png',
                  height: 150,
                ),
              ),
            ),
            const Flexible(
              flex: 1,
              child: Menu(),
            ),
            Flexible(
              flex: 14,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: cocktailsFirstHalf.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OpenContainer(
                          closedBuilder: (_, openContainer) => Dilemma(
                              leftTitle: cocktailsFirstHalf[index].name,
                              onLeftTitleTap: () {
                                print('left_cocktail_tapped');
                                chosenCocktailState.chosenCocktail =
                                    cocktailsFirstHalf[index];
                                openContainer();
                              },
                              leftTitleColor: kColorPink,
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                              leftWidget: ExtendedImage.network(
                                cocktailsFirstHalf[index].image,
                                width: 400,
                                height: 400,
                                fit: BoxFit.cover,
                                cache: true,
                                border: Border.all(
                                  color: Colors.red,
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                                //cancelToken: CancellationToken(),
                              ),
                              rightWidget: ExtendedImage.network(
                                cocktailsSecondHalf[index].image,
                                width: 400,
                                height: 400,
                                fit: BoxFit.cover,
                                cache: true,
                                border: Border.all(
                                  color: Colors.red,
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                                //cancelToken: CancellationToken(),
                              ),
                              rightTitleColor: kColorPink,
                              rightTitle: cocktailsSecondHalf[index].name,
                              onRightTitleTap: () {
                                print('right_cocktail_tapped');
                                chosenCocktailState.chosenCocktail =
                                    cocktailsSecondHalf[index];
                                openContainer();
                              }),
                          openBuilder: (_, closeContainer) => CocktailPage(
                            cocktail: chosenCocktailState.chosenCocktail,
                            onBack: closeContainer,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
