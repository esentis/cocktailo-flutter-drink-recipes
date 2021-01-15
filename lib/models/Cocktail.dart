import 'package:cocktailo/models/Ingredient.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class Cocktail {
  int id;
  String name;
  String category;
  String glassType;
  String image;
  String instructions;
  List<Ingredient> ingredients = [];

  /// Method that creates a Cocktail object from Map API response.
  void fromMap(Map<String, dynamic> cocktailMap) {
    id = int.parse(cocktailMap.entries
        .where((element) => element.key == 'idDrink')
        .first
        .value
        .toString());
    name = cocktailMap.entries
        .where((element) => element.key == 'strDrink')
        .first
        .value
        .toString();
    category = cocktailMap.entries
        .where((element) => element.key == 'strCategory')
        .first
        .value
        .toString();
    glassType = cocktailMap.entries
        .where((element) => element.key == 'strGlass')
        .first
        .value
        .toString();
    image = cocktailMap.entries
        .where((element) => element.key == 'strDrinkThumb')
        .first
        .value
        .toString();
    instructions = cocktailMap.entries
        .where((element) => element.key == 'strInstructions')
        .first
        .value
        .toString();
    var ingredientsMapped = cocktailMap.entries
        .where((element) =>
            element.key.contains('strIngredient') && element.value != null)
        .toList();
    var measures = cocktailMap.entries
        .where((element) =>
            element.key.contains('strMeasure') && element.value != null)
        .toList();
    for (var i = 0; i < ingredientsMapped.length; i++) {
      if (i >= measures.length) {
        ingredients
            .add(Ingredient(name: ingredientsMapped[i].value, measure: ''));
      } else {
        ingredients.add(Ingredient(
            name: ingredientsMapped[i].value, measure: measures[i].value));
      }
    }
  }
}
