import 'package:cocktailo/models/Cocktail.dart';
import 'package:flutter/foundation.dart';

class ChosenCocktail extends ChangeNotifier {
  Cocktail chosenCocktail;
  ChosenCocktail({
    this.chosenCocktail,
  });
  Cocktail get getCocktail => chosenCocktail;
  set setCocktail(Cocktail cocktail) {
    chosenCocktail = cocktail;
  }
}
