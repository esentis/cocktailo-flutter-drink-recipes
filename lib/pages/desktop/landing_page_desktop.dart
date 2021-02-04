import 'package:cocktailo/constants.dart';
import 'package:cocktailo/models/cocktail.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mouse_parallax/mouse_parallax.dart';

// ignore: must_be_immutable
class LandingPageDesktop extends ConsumerWidget {
  List<Cocktail> cocktails;
  LandingPageDesktop({this.cocktails});
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
          Flexible(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemCount: cocktails.length,
                itemBuilder: (context, index) => ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 150,
                    height: 150,
                    child: ExtendedImage(
                      image: Image.network(cocktails[index].image).image,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
