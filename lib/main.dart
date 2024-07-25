import 'package:cardapio/data/data.dart';
import 'package:cardapio/model/filter_settings.dart';
import 'package:cardapio/model/meal.dart';
import 'package:cardapio/screens/meal_detail_screen.dart';
import 'package:cardapio/screens/settings_screen.dart';
import 'package:cardapio/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

import 'screens/categories_meals_screen.dart';
import 'utils/app-routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FilterSettings filterSettings = FilterSettings();
  List<Meal> _availableMeals = MEALS;

  void _filterMeals(FilterSettings settings) {
    setState(() {
      filterSettings = settings;
      _availableMeals = MEALS.where(
        (meal) {
          final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
          final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
          final filtarVegan = settings.isVegan && !meal.isVegan;
          final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

          return !filterGluten &&
              !filterLactose &&
              !filtarVegan &&
              !filterVegetarian;
        },
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Let\'s cook?!',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 84, 98, 41),
        canvasColor: const Color.fromARGB(255, 191, 234, 104),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(
              meals: _availableMeals,
            ),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(
              onSettingsChanged: _filterMeals,
              filterSettings: filterSettings,
            ),
      },
    );
  }
}
