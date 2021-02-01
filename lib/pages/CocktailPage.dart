import 'package:cocktailo/constants.dart';
import 'package:cocktailo/models/Cocktail.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CocktailPage extends StatefulWidget {
  const CocktailPage({
    @required this.cocktail,
    this.onBack,
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;
  final Function onBack;

  @override
  _CocktailPageState createState() => _CocktailPageState();
}

class _CocktailPageState extends State<CocktailPage> {
  YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    // This is how the response looks
    if (widget.cocktail.videoUrl != 'null' &&
        widget.cocktail.videoUrl.isNotEmpty) {
      logger.wtf(widget.cocktail.videoUrl);
      var videoId = YoutubePlayer.convertUrlToId(widget.cocktail.videoUrl);
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: true,
        ),
      );
    }
  }

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
                  widget.cocktail.image,
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
                    onPressed: widget.onBack,
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
            widget.cocktail.name,
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
                  ...widget.cocktail.ingredients
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
                widget.cocktail.instructions,
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
          if (widget.cocktail.videoUrl != 'null' &&
              widget.cocktail.videoUrl.isNotEmpty)
            Flexible(
              flex: 2,
              child: YoutubePlayer(
                controller: _controller,
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
