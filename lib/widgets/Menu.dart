import 'package:cocktailo/constants.dart';
import 'package:cocktailo/pages/mobile/ingredients_page_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
          child: FlatButton(
            onPressed: () {
              Get.to(IngredientsPageMobile());
            },
            child: const Center(
              child: Icon(
                FontAwesome5.lemon,
                size: 15,
              ),
            ),
          ),
        ),
        Flexible(
          child: FlatButton(
            onPressed: () {},
            child: const Center(
              child: Icon(
                Icons.category,
                size: 15,
              ),
            ),
          ),
        ),
        Flexible(
          child: FlatButton(
            onPressed: () {},
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
