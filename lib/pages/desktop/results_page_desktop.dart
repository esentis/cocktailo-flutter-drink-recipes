import 'package:cocktailo/connection/api_connection.dart';
import 'package:cocktailo/constants.dart';
import 'package:cocktailo/models/cocktail.dart';
import 'package:cocktailo/pages/desktop/cocktail_page_desktop.dart';
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
    var response = await searchDrinkByIngredient(widget.ingredient);

    response['drinks'].forEach((element) {
      cocktails.add(Cocktail.fromMap(element));
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
      body: ListView.builder(
        itemCount: cocktails.length,
        itemBuilder: (context, index) => FlatButton(
          onPressed: () async {
            await Get.to(
              CocktailPageDesktop(
                cocktails[index],
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              cocktails[index].name,
              style: kBasicStyle.copyWith(
                fontSize: 22,
              ),
            ),
          ),
        ),
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
