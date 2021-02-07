import 'package:cocktailo/connection/api_connection.dart';
import 'package:cocktailo/constants.dart';
import 'package:cocktailo/pages/desktop/results_page_desktop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IngredientsPageDesktop extends StatefulWidget {
  @override
  _IngredientsPageDesktopState createState() => _IngredientsPageDesktopState();
}

class _IngredientsPageDesktopState extends State<IngredientsPageDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      ResultsPageDesktop(
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
