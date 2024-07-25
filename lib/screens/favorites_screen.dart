import 'package:cardapio/components/favorite_item.dart';
import 'package:cardapio/data/data.dart';
import 'package:cardapio/model/meal.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Meal> favoriteMeals = MEALS.where((meal) {
      return meal.isFavorite;
    }).toList();

    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You don\'t have favorites meals!'),
      );
    } else {
      return Scaffold(
        body: Center(
          child: ListView.builder(
            itemCount: favoriteMeals.length,
            itemBuilder: (ctx, index) {
              return FavoriteItem(
                meal: favoriteMeals[index],
              );
            },
          ),
        ),
      );
    }
  }
}
