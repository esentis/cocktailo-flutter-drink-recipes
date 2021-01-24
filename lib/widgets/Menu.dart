import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
            onPressed: () {},
            style: const NeumorphicStyle(
              color: Color(0xffED1E79),
              shadowDarkColor: Color(0xffED1E79),
              shadowDarkColorEmboss: Color(0xffED1E79),
              shadowLightColor: Color(0xffED1E79),
              shadowLightColorEmboss: Color(0xffED1E79),
              depth: 2,
              intensity: 0.5,
              lightSource: LightSource.topLeft,
              surfaceIntensity: 0.5,
              shape: NeumorphicShape.convex,
              boxShape: NeumorphicBoxShape.circle(),
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
            style: const NeumorphicStyle(
              color: Color(0xffED1E79),
              shadowDarkColor: Color(0xffED1E79),
              shadowDarkColorEmboss: Color(0xffED1E79),
              shadowLightColor: Color(0xffED1E79),
              shadowLightColorEmboss: Color(0xffED1E79),
              depth: 2,
              intensity: 0.5,
              lightSource: LightSource.topLeft,
              surfaceIntensity: 0.5,
              shape: NeumorphicShape.convex,
              boxShape: NeumorphicBoxShape.circle(),
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
            style: const NeumorphicStyle(
              color: Color(0xffED1E79),
              shadowDarkColor: Color(0xffED1E79),
              shadowDarkColorEmboss: Color(0xffED1E79),
              shadowLightColor: Color(0xffED1E79),
              shadowLightColorEmboss: Color(0xffED1E79),
              depth: 2,
              intensity: 0.5,
              lightSource: LightSource.topLeft,
              surfaceIntensity: 0.5,
              shape: NeumorphicShape.convex,
              boxShape: NeumorphicBoxShape.circle(),
            ),
            child: const Center(
              child: Icon(
                Foundation.heart,
                color: Color(0xff0f1123),
                size: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
