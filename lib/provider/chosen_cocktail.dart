import 'package:cocktailo/models/cocktail.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

final chosenCocktailProvider = ChangeNotifierProvider<ChosenCocktail>(
  (ref) {
    return ChosenCocktail();
  },
);
