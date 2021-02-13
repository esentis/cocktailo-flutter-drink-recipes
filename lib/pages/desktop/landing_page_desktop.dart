import 'package:auto_animated/auto_animated.dart';
import 'package:cocktailo/constants.dart';
import 'package:cocktailo/models/cocktail.dart';
import 'package:cocktailo/pages/desktop/cocktail_page_desktop.dart';
import 'package:cocktailo/widgets/animated_search.dart';
import 'package:cocktailo/pages/desktop/results_page_desktop.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mouse_parallax/mouse_parallax.dart';

// ignore: must_be_immutable
class LandingPageDesktop extends ConsumerWidget {
  List<Cocktail> cocktails;
  LandingPageDesktop({this.cocktails});
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchTextController = TextEditingController();

  void initSearch() {
    if (_searchTextController.text.length < 3) {
      Get.snackbar(
        '',
        'Search must not be blank',
        backgroundColor: kColorPink.withOpacity(0.8),
        titleText: Text(
          'Oops',
          textAlign: TextAlign.center,
          style: kBasicStyle,
        ),
        messageText: Text(
          'Search must have at least 3 characters',
          textAlign: TextAlign.center,
          style: kSecondaryStyle,
        ),
        maxWidth: 450,
      );
    }
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      backgroundColor: kColorDarkBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: 'cocktail_logo',
                child: Container(
                  child: ParallaxStack(layers: [
                    ParallaxLayer(
                      yRotation: -0.35,
                      xOffset: 40,
                      enable3D: true,
                      offset: const Offset(340, 0),
                      child: Image.asset(
                        'margharita.png',
                        height: 130,
                      ),
                    ),
                    ParallaxLayer(
                      yRotation: -0.6,
                      xRotation: -0.1,
                      offset: const Offset(0, 50),
                      xOffset: 80,
                      enable3D: true,
                      child: Image.asset('logo.png'),
                    ),
                  ]),
                ),
              ),
            ),
          ),
          AnimatedSearchBar(
            width: 250,
            helpText: 'Search by ingredient',
            onTapArrow: initSearch,
            onSubmit: (value) async {
              print('$value submitted');
              await Get.to(ResultsPageDesktop(ingredient: value));
            },
            textController: _searchTextController,
            onSuffixTap: () {
              print('tapped');
            },
            rtl: true,
          ),
          Text(
            'Popular drinks',
            style: kBasicStyle,
          ),
          Flexible(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: LiveGrid.options(
                options: animatedOptions,
                controller: _scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemCount: cocktails.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                  Animation<double> animation,
                ) {
                  return FadeTransition(
                    opacity: Tween<double>(begin: 0, end: 1).animate(animation),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, -0.1),
                        end: Offset.zero,
                      ).animate(animation),
                      child: GestureDetector(
                        onTap: () async {
                          await Get.to(CocktailPageDesktop(cocktails[index]));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 150,
                            height: 150,
                            child: Hero(
                              tag: cocktails[index].image,
                              child: ExtendedImage(
                                enableMemoryCache: true,
                                image:
                                    Image.network(cocktails[index].image).image,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
