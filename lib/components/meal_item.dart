import 'package:cardapio/model/meal.dart';
import 'package:cardapio/utils/app-routes.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({super.key, required this.meal});

  void _selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(AppRoutes.MEAL_DETAIL, arguments: meal)
        .then((result) {
      if (result == null) {
        print('no');
      } else {
        print('yes');
      }
    });
  }

  Widget _createItemDetail(IconData icon, String label) {
    return Row(
      children: <Widget>[
        Icon(icon),
        const SizedBox(
          width: 6,
        ),
        Text(label),
      ],
    );
  }

  Widget _createImageItem() {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Theme.of(context).canvasColor,
        elevation: 4,
        margin: const EdgeInsets.all(15),
        child: Container(
          child: Column(
            children: <Widget>[
              _createImageItem(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _createItemDetail(Icons.schedule, '${meal.duration}\''),
                    _createItemDetail(Icons.work, meal.complexityText),
                    _createItemDetail(Icons.attach_money, meal.costText),
                    if (meal.isFavorite)
                      _createItemDetail(Icons.favorite, 'Favorite')
                    else
                      _createItemDetail(Icons.favorite_border, 'Favorite'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
