import 'package:cocktailo/models/Cocktail.dart';
import 'package:cocktailo/widgets/TransformTo.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final dynamic apiResponse;
  const LandingPage({
    this.apiResponse,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1a1a2e),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/logo.png'))
              ],
            ),
            Expanded(
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
                            firstPage: ExtendedImage.network(
                              cocktail.image,
                              width: 400,
                              height: 400,
                              fit: BoxFit.fill,
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
