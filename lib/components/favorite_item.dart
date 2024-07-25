import 'package:cardapio/model/meal.dart';
import 'package:cardapio/utils/app-routes.dart';
import 'package:flutter/material.dart';

class FavoriteItem extends StatelessWidget {
  final Meal meal;
  const FavoriteItem({super.key, required this.meal});

  void _favoriteMeal(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.MEAL_DETAIL, arguments: meal);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _favoriteMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(15),
        child: Container(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Image.network(
                      meal.imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      child: Text(
                        meal.title,
                        style: const TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  )
                ],
              ),
              // InkWell(
              //   onTap: () => {},
              //   child: const Padding(
              //     padding: EdgeInsets.all(20),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       children: <Widget>[
              //         Row(
              //           children: <Widget>[
              //             Icon(Icons.delete),
              //             SizedBox(
              //               width: 6,
              //             ),
              //             Text('Remove Favorite'),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
