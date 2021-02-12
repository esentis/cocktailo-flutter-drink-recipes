import 'package:cocktailo/connection/api_connection.dart';
import 'package:cocktailo/constants.dart';
import 'package:cocktailo/models/cocktail.dart';
import 'package:cocktailo/pages/desktop/cocktail_page_desktop.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class ResultsPageDesktop extends StatefulWidget {
  final String ingredient;
  const ResultsPageDesktop({
    this.ingredient,
  });
  @override
  _ResultsPageDesktopState createState() => _ResultsPageDesktopState();
}

class _ResultsPageDesktopState extends State<ResultsPageDesktop> {
  List<Cocktail> cocktails = [];
  void searchResults() async {
    cocktails = await searchDrinkByIngredient(widget.ingredient);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    searchResults();
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
            style: kBasicStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ),
        leading: FlatButton(
          onPressed: Get.back,
          padding: const EdgeInsets.all(5),
          child: Icon(
            Foundation.arrow_left,
            size: 35,
            color: kColorPink,
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        itemCount: cocktails.length,
        itemBuilder: (context, index) => GestureDetector(
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
                  image: Image.network(cocktails[index].image).image,
                ),
              ),
            ),
          ),
        ),
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
