import 'package:cocktailo/models/Cocktail.dart';
import 'package:cocktailo/widgets/Dillema.dart';
import 'package:cocktailo/widgets/TransformTo.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:cocktailo/widgets/Menu.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class LandingPage extends StatelessWidget {
  final dynamic apiResponse;
  const LandingPage({
    this.apiResponse,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0f1123),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                child: Image.asset(
                  'assets/logo.png',
                  height: 150,
                ),
              ),
            ),
            const Flexible(
              flex: 1,
              child: Menu(),
            ),
            Flexible(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                ),
                child: ListView.builder(
                  itemCount: apiResponse.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: apiResponse['drinks'].length,
                        itemBuilder: (context, index) {
                          var cocktail = Cocktail();
                          // We map the snapshot to a cocktail for easier access
                          cocktail.fromMap(apiResponse['drinks'][index]);
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TransformTo(
                              firstPage: Dilemma(
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                leftWidget: ExtendedImage.network(
                                  cocktail.image,
                                  width: 400,
                                  height: 400,
                                  fit: BoxFit.cover,
                                  cache: true,
                                  border: Border.all(
                                    color: Colors.red,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                  //cancelToken: CancellationToken(),
                                ),
                                rightWidget: ExtendedImage.network(
                                  cocktail.image,
                                  width: 400,
                                  height: 400,
                                  fit: BoxFit.cover,
                                  cache: true,
                                  border: Border.all(
                                    color: Colors.red,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                  //cancelToken: CancellationToken(),
                                ),
                              ),
                              secondPage: Scaffold(
                                body: Column(
                                  children: [
                                    ExtendedImage.network(
                                      cocktail.image,
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
                                                          child:
                                                              Text(e.measure),
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
            ),
          ],
        ),
      ),
    );
  }
}
