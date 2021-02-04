import 'package:animations/animations.dart';
import 'package:cocktailo/constants.dart';
import 'package:cocktailo/models/cocktail.dart';
import 'package:cocktailo/pages/mobile/cocktail_page_mobile.dart';
import 'package:cocktailo/provider/chosen_cocktail.dart';
import 'package:cocktailo/widgets/dillema.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:cocktailo/widgets/menu.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class LandingPageMobile extends ConsumerWidget {
  final List<Cocktail> cocktailsResponse;
  LandingPageMobile({
    this.cocktailsResponse,
  });
  List<Cocktail> cocktailsFirstHalf = [];
  List<Cocktail> cocktailsSecondHalf = [];

  void mapCocktails() {
    logger.wtf('All popular cocktails are ${cocktailsResponse.length}');
    cocktailsFirstHalf =
        cocktailsResponse.sublist(0, (cocktailsResponse.length / 2).floor());
    cocktailsSecondHalf = cocktailsResponse.sublist(
        (cocktailsResponse.length / 2).floor(), cocktailsResponse.length);
    logger.wtf(cocktailsFirstHalf.toString());
    logger.wtf(cocktailsSecondHalf.toString());
    logger.wtf('${cocktailsFirstHalf.length} ${cocktailsSecondHalf.length}');
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    mapCocktails();
    var chosenCocktailState = watch(chosenCocktailProvider);
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
                          openBuilder: (_, closeContainer) =>
                              CocktailPageMobile(
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
