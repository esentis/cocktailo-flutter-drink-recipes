import 'package:cocktailo/connection/api_connection.dart';
import 'package:cocktailo/widgets/TransformTo.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () async {
                await searchDrinkByIngredient('Gin');
              },
            ),
            TransformTo(
              firstPage: Container(
                width: 150,
                height: 150,
                color: Colors.white,
              ),
              secondPage: Container(
                color: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
