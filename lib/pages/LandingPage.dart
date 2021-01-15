import 'package:cocktailo/connection/api_connection.dart';
import 'package:cocktailo/models/Cocktail.dart';
import 'package:cocktailo/widgets/TransformTo.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1a1a2e),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Color(0xff1a1a2e),
                    width: 80,
                    height: 80,
                    child: Lottie.asset(
                      'assets/cocktails.json',
                    ),
                  ),
                ),
                const Flexible(
                  flex: 3,
                  child: Text(
                    'Cocktailo',
                    style: TextStyle(
                      color: Color(0xffe94560),
                      fontSize: 25,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Color(0xff1a1a2e),
                    width: 80,
                    height: 80,
                    child: Lottie.asset(
                      'assets/cocktails.json',
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: getPopularDrinks(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data['drinks'].length,
                      itemBuilder: (context, index) {
                        var cocktail = Cocktail();
                        // We map the snapshot to a cocktail for easier access
                        cocktail.fromMap(snapshot.data['drinks'][index]);
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TransformTo(
                            firstPage: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Image.network(
                                  cocktail.image,
                                ),
                              ),
                            ),
                            secondPage: Scaffold(
                              body: Column(
                                children: [
                                  Image.network(
                                    cocktail.image,
                                  ),
                                  Text(
                                    cocktail.name,
                                  ),
                                  Flexible(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ...cocktail.ingredients
                                            .map((e) => Flexible(
                                                  child: Column(
                                                    children: [
                                                      Flexible(
                                                        child: Text(e.name),
                                                      ),
                                                      Flexible(
                                                        child: Text(e.measure),
                                                      ),
                                                    ],
                                                  ),
                                                ))
                                            .toList()
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      cocktail.instructions,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
