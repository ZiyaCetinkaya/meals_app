import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';

import '../models/meal.dart';
import '../data/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  final List<Meal> _meals;

  const CategoryMealsScreen(this._meals);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final _categoryTitle = routeArgs['categoryTitle'];
    final _categoryId = routeArgs['categoryId'];

    final _categoryMeals = _meals.where((meal) {
      return meal.categoryIds.contains(_categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _categoryMeals[index].id,
            title: _categoryMeals[index].title,
            imageUrl: _categoryMeals[index].imageUrl,
            duration: _categoryMeals[index].duration,
            complexity: _categoryMeals[index].complexity,
            affordability: _categoryMeals[index].affordability,
          );
        },
        itemCount: _categoryMeals.length,
      ),
    );
  }
}
