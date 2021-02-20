import 'package:cocktailo/constants.dart';
import 'package:cocktailo/models/cocktail.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CocktailPageMobile extends StatefulWidget {
  const CocktailPageMobile({
    @required this.cocktail,
    this.onBack,
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;
  final Function onBack;

  @override
  _CocktailPageMobileState createState() => _CocktailPageMobileState();
}

class _CocktailPageMobileState extends State<CocktailPageMobile> {
  final ScrollController _ingredientsScrollController = ScrollController();
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
    widget.cocktail.ingredients.forEach((element) {
      kLogger.wtf(element.name);
    });
    return Scaffold(
      backgroundColor: kColorDarkBlue,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(60),
                bottomLeft: Radius.circular(60),
              ),
            ),
            // Display a placeholder widget to visualize the shrinking size.
            flexibleSpace: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40)),
                  child: ExtendedImage.network(
                    widget.cocktail.image,
                    fit: BoxFit.cover,
                    cache: true,
                    border: Border.all(
                      color: Colors.red,
                      width: 1.0,
                    ),
                    //cancelToken: cancellationToken,
                  ),
                ),
              ],
            ),
            expandedHeight: MediaQuery.of(context).size.height * .7,
            toolbarHeight: MediaQuery.of(context).size.height * .5,
            leading: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5,
                ),
                child: FlatButton(
                  onPressed: widget.onBack,
                  padding: const EdgeInsets.all(5),
                  child: Icon(
                    Foundation.arrow_left,
                    size: 35,
                    color: kColorPink,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                widget.cocktail.name,
                style: kBasicStyle.copyWith(
                  fontSize: 22,
                ),
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 15,
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                widget.cocktail.instructions,
                textAlign: TextAlign.center,
                style: kBasicStyle.copyWith(
                  fontSize: 15,
                ),
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 15,
            ),
          ),
          if (widget.cocktail.videoUrl != 'null' &&
              widget.cocktail.videoUrl.isNotEmpty)
            SliverToBoxAdapter(
              child: YoutubePlayer(
                controller: _controller,
                bottomActions: [
                  CurrentPosition(),
                  ProgressBar(isExpanded: true),
                  RemainingDuration(),
                ],
              ),
            ),
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                'Ingredients',
                style: kBasicStyle.copyWith(
                  fontSize: 17,
                ),
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 15,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: 250,
              height: 250,
              child: ListView.builder(
                itemCount: widget.cocktail.ingredients.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    widget.cocktail.ingredients[index].name,
                    style: kSecondaryStyle.copyWith(
                      fontSize: 17,
                    ),
                  ),
                  subtitle: Text(
                    widget.cocktail.ingredients[index].measure,
                    style: kSecondaryStyle.copyWith(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Text(
          //   widget.cocktail.name,
          //   style: kBasicStyle.copyWith(
          //     fontSize: 22,
          //   ),
          // ),
        ],
      ),
    );
  }
}
