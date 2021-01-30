import 'package:cocktailo/constants.dart';
import 'package:cocktailo/pages/IngredientsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: NeumorphicButton(
            onPressed: () {
              Get.to(IngredientsPage());
            },
            style: NeumorphicStyle(
              color: kColorPink,
              shadowDarkColor: kColorPink,
              shadowDarkColorEmboss: kColorPink,
              shadowLightColor: kColorPink,
              shadowLightColorEmboss: kColorPink,
              depth: 2,
              intensity: 0.5,
              lightSource: LightSource.topLeft,
              surfaceIntensity: 0.5,
              shape: NeumorphicShape.convex,
              boxShape: const NeumorphicBoxShape.circle(),
            ),
            child: const Center(
              child: Icon(
                FontAwesome5.lemon,
                size: 15,
              ),
            ),
          ),
        ),
        Flexible(
          child: NeumorphicButton(
            onPressed: () {},
            style: NeumorphicStyle(
              color: kColorPink,
              shadowDarkColor: kColorPink,
              shadowDarkColorEmboss: kColorPink,
              shadowLightColor: kColorPink,
              shadowLightColorEmboss: kColorPink,
              depth: 2,
              intensity: 0.5,
              lightSource: LightSource.topLeft,
              surfaceIntensity: 0.5,
              shape: NeumorphicShape.convex,
              boxShape: const NeumorphicBoxShape.circle(),
            ),
            child: const Center(
              child: Icon(
                Icons.category,
                size: 15,
              ),
            ),
          ),
        ),
        Flexible(
          child: NeumorphicButton(
            onPressed: () {},
            style: NeumorphicStyle(
              color: kColorPink,
              shadowDarkColor: kColorPink,
              shadowDarkColorEmboss: kColorPink,
              shadowLightColor: kColorPink,
              shadowLightColorEmboss: kColorPink,
              depth: 2,
              intensity: 0.5,
              lightSource: LightSource.topLeft,
              surfaceIntensity: 0.5,
              shape: NeumorphicShape.convex,
              boxShape: const NeumorphicBoxShape.circle(),
            ),
            child: Center(
              child: Icon(
                Foundation.heart,
                color: kColorDarkBlue,
                size: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
