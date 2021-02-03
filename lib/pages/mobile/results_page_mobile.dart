import 'package:cocktailo/connection/api_connection.dart';
import 'package:cocktailo/constants.dart';
import 'package:cocktailo/models/cocktail.dart';
import 'package:cocktailo/pages/mobile/cocktail_page_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

var logger = Logger();

// TODO: FIX THE LIST
class ResultsPageMobile extends StatefulWidget {
  final String ingredient;
  const ResultsPageMobile({
    this.ingredient,
  });
  @override
  _ResultsPageMobileState createState() => _ResultsPageMobileState();
}

class _ResultsPageMobileState extends State<ResultsPageMobile> {
  List<Cocktail> cocktails = [];
  void searchResults() async {
    var response = await searchDrinkByIngredient(widget.ingredient);

    response['drinks'].forEach((element) {
      var cocktail = Cocktail();
      cocktail.fromMap(element);
      cocktails.add(cocktail);
    });
    logger.wtf(cocktails.length.toString());
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
      body: ListView.builder(
        itemCount: cocktails.length,
        itemBuilder: (context, index) => FlatButton(
          onPressed: () async {
            await Get.to(
              CocktailPageMobile(
                cocktail: cocktails[index],
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              cocktails[index].name,
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
          ),
        ),
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
