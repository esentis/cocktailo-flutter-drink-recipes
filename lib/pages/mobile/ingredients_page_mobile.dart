import 'package:cocktailo/connection/api_connection.dart';
import 'package:cocktailo/constants.dart';
import 'package:cocktailo/pages/mobile/results_page_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class IngredientsPageMobile extends StatefulWidget {
  @override
  _IngredientsPageMobileState createState() => _IngredientsPageMobileState();
}

class _IngredientsPageMobileState extends State<IngredientsPageMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorDarkBlue,
      appBar: AppBar(
        backgroundColor: kColorDarkBlue,
        title: Center(
          child: Text(
            'Search cocktails based on ingredient',
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
      body: FutureBuilder(
        future: getIngredients(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: kColorPink.withOpacity(0.5),
              valueColor: AlwaysStoppedAnimation<Color>(kColorPink),
              strokeWidth: 14,
            ));
          }

          logger.wtf(snapshot.data['drinks'].length);
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data['drinks'].length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                  vertical: 12,
                ),
                child: FlatButton(
                  onPressed: () async {
                    await Get.to(
                      ResultsPageMobile(
                        ingredient: snapshot.data['drinks'][index]
                            ['strIngredient1'],
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      snapshot.data['drinks'][index]['strIngredient1'],
                      style: kBasicStyle.copyWith(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
