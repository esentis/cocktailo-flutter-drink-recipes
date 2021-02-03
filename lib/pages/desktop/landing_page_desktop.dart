import 'package:cocktailo/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mouse_parallax/mouse_parallax.dart';

class LandingPageDesktop extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      backgroundColor: kColorDarkBlue,
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          child: ParallaxStack(layers: [
            ParallaxLayer(
              yRotation: -0.35,
              xOffset: 40,
              enable3D: true,
              offset: const Offset(340, 0),
              child: Image.asset(
                'margharita.png',
                height: 130,
              ),
            ),
            ParallaxLayer(
              yRotation: -0.6,
              xRotation: -0.1,
              offset: const Offset(0, 50),
              xOffset: 80,
              enable3D: true,
              child: Image.asset('logo.png'),
            ),
          ]),
        ),
      ),
    );
  }
}
