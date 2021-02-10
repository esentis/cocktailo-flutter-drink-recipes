import 'package:cocktailo/models/ingredient.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class Cocktail {
  int id = 0;
  String name = '';
  String category = '';
  String glassType = '';
  String image = '';
  String instructions = '';
  String videoUrl = '';
  List<Ingredient> ingredients = [];
  static List<Ingredient> temporaryIngredients = [];
  Cocktail({
    this.category,
    this.glassType,
    this.id,
    this.image,
    this.ingredients,
    this.instructions,
    this.name,
    this.videoUrl,
  });

  static List<Ingredient> mapIngredients(Map<String, dynamic> cocktailMap) {
    var ingredientsMapped = cocktailMap.entries
        .where((element) =>
            element.key.contains('strIngredient') && element.value != null)
        .toList();
    var measures = cocktailMap.entries
        .where((element) =>
            element.key.contains('strMeasure') && element.value != null)
        .toList();
    if (ingredientsMapped.isNotEmpty) {
      for (var i = 0; i < ingredientsMapped.length; i++) {
        if (i >= measures.length) {
          temporaryIngredients
              .add(Ingredient(name: ingredientsMapped[i].value, measure: ''));
        } else {
          temporaryIngredients.add(Ingredient(
              name: ingredientsMapped[i].value, measure: measures[i].value));
        }
      }
    }
    return temporaryIngredients;
  }

  /// Method that creates a Cocktail object from Map API response.
  factory Cocktail.fromMap(Map<String, dynamic> cocktailMap) => Cocktail(
        category: cocktailMap.entries.contains('strCategory')
            ? cocktailMap.entries
                .firstWhere((element) => element.key == 'strCategory')
                .value
                .toString()
            : '',
        glassType: cocktailMap.entries.contains('strGlass')
            ? cocktailMap.entries
                .firstWhere((element) => element.key == 'strGlass')
                .value
                .toString()
            : '',
        id: int.parse(cocktailMap.entries
            .firstWhere((element) => element.key == 'idDrink')
            .value
            .toString()),
        image: cocktailMap.entries
            .where((element) => element.key == 'strDrinkThumb')
            .first
            .value
            .toString(),
        ingredients: mapIngredients(cocktailMap),
        instructions: cocktailMap.entries
            .where((element) => element.key == 'strInstructions')
            .first
            .value
            .toString(),
        name: cocktailMap.entries
            .firstWhere((element) => element.key == 'strDrink')
            .value
            .toString(),
        videoUrl: cocktailMap.entries.contains('strVideo')
            ? cocktailMap.entries
                .firstWhere((element) => element.key == 'strVideo')
                .value
                .toString()
            : '',
      );
}
