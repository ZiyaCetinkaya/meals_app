import 'package:flutter/material.dart';

import '../models/meal.dart';

import '../data/dummy_data.dart';
import '../screens/meal_details_screen.dart';

class PopularMeals extends StatelessWidget {
  List<Meal> get _popularMeals {
    var allMeals = List.of(DUMMY_MEALS);
    allMeals.sort((a, b) => b.popularity.compareTo(a.popularity));
    return allMeals.take(5).toList();
  }

  void _goToMealDetail(BuildContext ctx, String mealId) {
    Navigator.of(ctx).pushNamed(MealDetailsScreen.routeName, arguments: mealId);
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Popular Meals",
          style: Theme.of(context).textTheme.headline6,
        ),
        Divider(),
        Container(
          width: _screenWidth,
          height: 210,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => _goToMealDetail(context, _popularMeals[index].id),
                child: Column(
                  children: [
                    Container(
                      width: 180,
                      height: 210,
                      child: Card(
                        elevation: 4,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                              ),
                              child: Image.network(
                                _popularMeals[index].imageUrl,
                                fit: BoxFit.cover,
                                height: 160,
                              ),
                            ),
                            Container(
                              width: 180,
                              padding: EdgeInsets.all(5),
                              child: Text(
                                _popularMeals[index].title,
                                softWrap: true,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: _popularMeals.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
