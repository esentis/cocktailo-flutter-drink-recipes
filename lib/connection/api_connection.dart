import 'package:cocktailo/constants.dart';
import 'package:cocktailo/models/cocktail.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

var logger = Logger();
BaseOptions dioTmdbOptions = BaseOptions(
  baseUrl: 'https://the-cocktail-db.p.rapidapi.com/',
  receiveDataWhenStatusError: true,
  headers: {
    'x-rapidapi-key': DotEnv().env['API_KEY'],
    'x-rapidapi-host': 'the-cocktail-db.p.rapidapi.com'
  },
  connectTimeout: 6 * 1000, // 6 seconds
  receiveTimeout: 6 * 1000, // 6 seconds
);
Dio tmdb = Dio(dioTmdbOptions);

/// Returns list of categories.
Future getCategories() async {
  Response response;
  try {
    response = await tmdb.get('list.php?c=list');
    logger.i('Getting list of all categories');
  } on DioError catch (e) {
    logger.e(e);
    return e.type;
  }
  return response.data;
}

Future getIngredients() async {
  Response response;
  try {
    response = await tmdb.get('list.php?i=list');
    logger.i('Getting list of all ingredients.');
  } on DioError catch (e) {
    logger.e(e);
    return e.type;
  }
  return response.data;
}

Future getAlcoholicFilters() async {
  Response response;
  try {
    response = await tmdb.get('list.php?a=list');
    logger.i('Getting list of alcoholic filters.');
  } on DioError catch (e) {
    logger.e(e);
    return e.type;
  }
  return response.data;
}

Future getGlassTypes() async {
  Response response;
  try {
    response = await tmdb.get('list.php?g=list');
    logger.i('Getting list of glass types.');
  } on DioError catch (e) {
    logger.e(e);
    return e.type;
  }
  return response.data;
}

Future getLatestDrinks() async {
  Response response;
  try {
    response = await tmdb.get('latest');
    logger.i('Getting list of latest drinks');
  } on DioError catch (e) {
    logger.e(e);
    return e.type;
  }
  return response.data;
}

Future getRandomDrink() async {
  Response response;
  try {
    response = await tmdb.get('random');
    logger.i('Getting a random drink.');
  } on DioError catch (e) {
    logger.e(e);
    return e.type;
  }
  return response.data;
}

Future getPopularDrinks() async {
  Response response;
  try {
    response = await tmdb.get('popular.php');
    logger.i('Getting popular drinks.');
  } on DioError catch (e) {
    logger.e(e);
    return e.type;
  }

  // ignore: omit_local_variable_types
  List<Cocktail> cocktails = [];
  response.data['drinks'].forEach((element) {
    cocktails.add(Cocktail.fromMap(element));
  });
  return cocktails;
}

Future searchDrinkByIngredient(String ingredient) async {
  Response response;
  try {
    response = await tmdb.get('filter.php?i=$ingredient');
    logger.i('Search drinks with $ingredient as ingredient.');
    logger.i(response.data);
    // ignore: omit_local_variable_types
    List<Cocktail> cocktails = [];
    response.data['drinks'].forEach((element) {
      cocktails.add(Cocktail.fromMap(element));
    });
    return cocktails;
  } on DioError catch (e) {
    logger.e(e);
    return e.type;
  }
}

Future searchDrinkByName(String name) async {
  Response response;
  try {
    response = await tmdb.get('search.php?i=$name');
    logger.i('Search drinks with name $name.');
  } on DioError catch (e) {
    logger.e(e);
    return e.type;
  }
  return response.data;
}
