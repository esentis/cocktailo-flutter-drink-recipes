import 'package:cocktailo/constants.dart';
import 'package:cocktailo/models/cocktail.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mouse_parallax/mouse_parallax.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CocktailPageDesktop extends ConsumerWidget {
  final Cocktail cocktail;
  const CocktailPageDesktop(this.cocktail);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    print(cocktail.videoUrl);
    print('helllo');
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
          Flexible(
            child: Hero(
              tag: cocktail.image,
              child: ExtendedImage(
                width: 550,
                height: 550,
                image: Image.network(cocktail.image).image,
              ),
            ),
          ),
          if (cocktail.videoUrl.isNotEmpty)
            Flexible(
              flex: 2,
              child: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId:
                      YoutubePlayer.convertUrlToId(cocktail.videoUrl),
                  flags: const YoutubePlayerFlags(
                    autoPlay: true,
                    mute: true,
                  ),
                ),
                bottomActions: [
                  CurrentPosition(),
                  ProgressBar(isExpanded: true),
                  RemainingDuration(),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
